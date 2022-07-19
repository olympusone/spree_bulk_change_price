module Spree
  module Admin
    class BulkChangePriceController < Spree::Admin::BaseController
      def change
        products = case params[:products]
                    when 'all'
                      Spree::Variant.all
                    when 'category'
                      product_ids = Spree::Taxon.where(id: params[:taxon_ids]).map(&:product_ids)
                      Spree::Variant.where(product_id: product_ids.flatten.uniq)
                    when 'selected'
                      Spree::Variant.where(product_id: params[:product_ids])
                    end

        if products
          case params[:bulk_action]
          when 'change_price'
            change_price(products, params[:update_type], params[:operation], params[:update_value])
          when 'add_special_price'
            add_special_price(products, params[:update_type], params[:operation], params[:update_value])
          when 'delete_special_price'
            delete_special_price(products)
          end
        end

        render json: {ok: true}
      end

      private
      def change_price(products, update_type, operation, update_value)
        products.each do |p|
          if p.compare_at_price.to_f > 0
            price = calculate_price(p.price, update_type, operation, update_value)
            compare_at_price = calculate_price(p.compare_at_price, update_type, operation, update_value)

            p.update price: price, compare_at_price: compare_at_price
          else
            price = calculate_price(p.price, update_type, operation, update_value)

            p.update price: price > 0 ? price : 0
          end
        end
      end

      def add_special_price(products, update_type, operation, update_value)
        products.each do |p|
          if p.compare_at_price.to_f > 0
            # TODO
          else
            compare_at_price = p.price.to_f
            price = calculate_price(p.price, update_type, operation, update_value)

            p.update price: price, compare_at_price: compare_at_price
          end
        end
      end

      def delete_special_price(products)
        products.each do |p|
          if p.compare_at_price.to_f > 0
            p.update price: p.compare_at_price, compare_at_price: nil
          end
        end
      end

      def calculate_price(price, update_type, operation, update_value)
        if update_type == 'percent'
          result = price.to_f * (update_value.to_f / 100)

          price.send(operation, result).to_f
        elsif update_type == 'fixed'
          price.send(operation, result).to_f
        end
      end
    end
  end
end  