module Spree::Admin::BulkChangePriceHelper
    def bulk_change_price_bulk_actions
        [
            ["change_price", Spree.t('bulk_change_price_form.change_price')],
            ["add_special_price", Spree.t('bulk_change_price_form.add_special_price')],
            ["change_special_price", Spree.t('bulk_change_price_form.change_special_price')],
            ["delete_special_price", Spree.t('bulk_change_price_form.delete_special_price')],
        ]
    end

    def bulk_change_price_products
        [
            ["all", Spree.t('bulk_change_price_form.all')],
            ["category", Spree.t('bulk_change_price_form.category')],
            ["selected", Spree.t('bulk_change_price_form.selected')],
        ]
    end

    def bulk_change_price_update_type
        [
            ["percent", Spree.t('bulk_change_price_form.percent')],
            ["fixed", Spree.t('bulk_change_price_form.fixed')],
        ]
    end

    def bulk_change_price_operations
        [
            "+",
            "-",
        ]
    end

    def bulk_change_price_round_method
        [
            ["round", Spree.t('bulk_change_price_form.round_method_options.round')],
            ["floor", Spree.t('bulk_change_price_form.round_method_options.floor')],
            ["ceil", Spree.t('bulk_change_price_form.round_method_options.ceil')],
        ]
    end
end