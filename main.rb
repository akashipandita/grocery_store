class GroceryStore
    attr_accessor :items_list, :sales_item_list
    def initialize()
        @items_details = {
            "milk" => {  
                "price" => 3.97,
                "sale_price" => 2.50,
                "sale_quant" =>32
            },
            "bread" => { 
                "price" => 2.17, 
                "sale_price" => 2.0, 
                "sale_quant" => 3
            }, 
            "apple" => { 
                "rice" => 0.89
            },
            "banana" =>{ 
                "price" => 0.99 
            }
        }
    end
end

$input = []
$input_hash = {
    'banana' => 0,
    'apple' => 0,
    'milk' => 0,
    'bread' => 0
}

def input_user
    puts "Enter the items purchased separated by coma(,)"
    $input=gets.chomp.split(',')
    p $input
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
    
    p $input_hash
end

input_user
# p $input.count('banana')