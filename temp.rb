require 'terminal-table'

class GroceryStore
    private

    attr_accessor :items_list, :sales_item_list
    def initialize()
        @items_details = {
            "milk" => {  
                "price" => 3.97,
                "sale_price" => 2.50,
                "sale_quant" => 2
            },
            "bread" => { 
                "price" => 2.17, 
                "sale_price" => 2.0, 
                "sale_quant" => 3
            }, 
            "apple" => { 
                "price" => 0.89
            },
            "banana" =>{ 
                "price" => 0.99 
            }
        }
    end
    $input = []
    $input_hash = {
        'banana' => 0,
        'apple' => 0,
        'milk' => 0,
        'bread' => 0
    }
    $total_before_discount = 0
    $total_after_discount = 0
    $rows = []

    public

    def input_user
        puts "Enter the items purchased separated by coma(,)"
        $input=gets.chomp.split(',')
        # p $input
        $input.each do | item |
            if($input.include?(item))
                $input_hash[item] = $input.count(item)
            elsif(i$nput.include?(item))
                $input_hash[item] = $input.count(item)
            elsif($input.include?(item))
                $input_hash[item] = $input.count(item)
            elsif($input.include?(item))
                $input_hash[item] = $input.count(item)
            end
        end
        
        # p $input_hash
    end

    def total_cost_before_sale
        $input_hash.each do |item, quant|
            # p " item -> #{item} , quant -> #{quant} , #{@items_details[item]["price"]}"
            $total_before_discount = $total_before_discount + @items_details[item]["price"] * quant
        end
        # p "Total cost = #{$total_before_discount}"
    end

    def total_cost_after_sale
        $input_hash.each do |item, quant|
            cost = 0
            if(@items_details[item]["sale_price"])
                if(quant >= @items_details[item]["sale_quant"])
                    cost = ((@items_details[item]["sale_quant"] * @items_details[item]["sale_price"]) * (quant / @items_details[item]["sale_quant"]) ) + (@items_details[item]["price"] * (quant % @items_details[item]["sale_quant"]))
                    $total_after_discount = $total_after_discount + ((@items_details[item]["sale_quant"] * @items_details[item]["sale_price"]) * (quant / @items_details[item]["sale_quant"]) ) + (@items_details[item]["price"] * (quant % @items_details[item]["sale_quant"]))
                else
                    cost = $total_after_discount + @items_details[item]["price"] * quant
                    $total_after_discount = $total_after_discount + @items_details[item]["price"] * quant
                end
            else
                cost = $total_after_discount + @items_details[item]["price"] * quant
                $total_after_discount = $total_after_discount + @items_details[item]["price"] * quant
            end
            $rows << [item.capitalize(), quant, "$#{cost}"]
        end
        # p "Total cost after discount = #{$total_after_discount}"
    end

    def display_bill
        table = Terminal::Table.new :headings => ['Item', 'Quantity', 'Price'], :rows => $rows
        puts table
        puts "Total price : $#{$total_after_discount.round(2)}"
        puts "You saved $#{($total_before_discount - $total_after_discount).round(2)} today"
    end
end

grocery = GroceryStore.new
grocery.input_user
grocery.total_cost_before_sale
grocery.total_cost_after_sale
grocery.display_bill
# p $input.count('banana')


# milk,milk,bread,banana,bread,bread,bread,milk,apple
# Total price : $19.02
# You saved $3.45 today.