module Spree::Admin::BulkChangePriceHelper
    def bulk_change_price_bulk_actions
        [
            ["change_price", "Change Price"],
            ["add_special_price", "Add Special Price"],
            ["delete_special_price", "Delete Special Price"],
        ]
    end

    def bulk_change_price_products
        [
            ["all", "All Products"],
            ["category", "By Category"],
            ["selected", "Selected Products"],
        ]
    end

    def bulk_change_price_update_type
        [
            ["percent", "Percent"],
            ["fixed", "Fixed"],
        ]
    end

    def bulk_change_price_operations
        [
            "+",
            "-",
            # "x",
            # "/",
            # "="
        ]
    end
end