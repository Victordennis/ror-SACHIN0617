class Item
  @@item_list = {}

  def self.add(name, price)
    validate_nil_parameters(name, price)
    validate_item_presence(name, price)
    
    @@item_list[name] = { name: name, price: price }
  end

  def self.all
    @@item_list
  end

  def self.where(name)
    @@item_list[name]
  end

  private

  def self.validate_nil_parameters(name, price)
    if name.nil? || price.nil?
      puts "Name and price for item can't be nil."
      return
    end
  end

  def self.validate_item_presence(name, price)
    items = all
    if items[name]
      items[name][:price] = price
      return
    end
  end
end

# =====================================================================

# Create Items
Item.add("Milk", 3.97)
Item.add("Bread", 2.17)
Item.add("Banana", 0.99)
Item.add("Apple", 0.89)

# =====================================================================

class SaleItems
  @@offers = {}

  def self.add(name, quantity, price)
    if name.nil? || price.nil? || quantity.nil?
      puts "Name, price & quantity for offers can't be nil."
      return
    end 

    items = Item.all

    if items[name]
      @@offers[name] = { name: name, price: price, quantity: quantity }
      return
    end
  end

  def self.all
    @@offers
  end

  def self.where(name)
    @@offers[name]
  end
end

# =====================================================================

# Create offers
SaleItems.add("Milk", 2, 5.00)
SaleItems.add("Bread", 3, 6.00)

# =====================================================================

class InvoiceDetails
  attr_reader :purchased_items

  attr_accessor :purchase_details, :invoice_amount_without_discount, :invoice_amount

  def initialize(purchased_items)
    @purchased_items = purchased_items
    @invoice_amount = 0
    @invoice_amount_without_discount = 0
    @purchase_details = {}
  end

  def execute
    purchase_item_summary
    calculate_invoice_amount

    return {
      invoice_amount: invoice_amount.round(2),
      purchase_details: purchase_details.values,
      saved_amount: (invoice_amount_without_discount - invoice_amount).round(2)
    }
  end

  private

  def purchase_item_summary
    purchased_items.each do |item|
      item = item.capitalize
      purchase_details[item] = {} if !purchase_details[item]
      purchase_details[item][:quantity] = purchase_details[item][:quantity] ? purchase_details[item][:quantity] + 1 : 1
      purchase_details[item][:name] = item
    end
  end

  def calculate_invoice_amount
    purchase_details.keys.each do |key|
      sale_item = SaleItems.where(key)
      item = Item.where(key)
      if sale_item
        remainder = purchase_details[key][:quantity]%sale_item[:quantity]
        divider = (purchase_details[key][:quantity]/sale_item[:quantity]).to_i
        purchase_details[key][:amount] = divider * sale_item[:price] + remainder * item[:price]
      else
        purchase_details[key][:amount] = purchase_details[key][:quantity] * item[:price]
      end
      
      @invoice_amount += purchase_details[key][:amount]
      @invoice_amount_without_discount += (purchase_details[key][:quantity] * item[:price])
    end
  end
end

# =====================================================================

class Purchase
  def self.generate_bill
    puts "Please enter all the items purchased separated by a comma\n"
    input = gets
    puts "\n"


    items = input.split(' ').join().split(',')
    bill_details = InvoiceDetails.new(items).execute

    puts "Item      Quantity      Price"
    puts "--------------------------------------"
    bill_details[:purchase_details].each do |item|
      puts "#{'%-10s' % item[:name]}#{'%-14s' % item[:quantity]}$#{item[:amount]}"
    end

    puts "\n"

    puts "Total price : $#{bill_details[:invoice_amount]}\n"
    puts "You saved $#{bill_details[:saved_amount]} today."
  end
end

# =====================================================================

Purchase.generate_bill

