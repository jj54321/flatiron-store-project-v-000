class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def total
    output = 0
    self.line_items.each do |li|
      output += li.item.price * li.quantity
    end
    output
  end

  def add_item(item)
    add = self.line_items.find_by(item_id: item)
    if add
      add.quantity += 1
    else
      add = line_items.build(item_id: item, cart_id: self.id)
    end
    add
  end


end
