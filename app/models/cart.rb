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
      add = self.line_items.build(item_id: item, cart_id: self.id)
    end
    add
  end

  def checkout_cart
    self.line_items.each do |li|
      li.item.inventory -= li.quantity
      li.item.save
    end
    self.line_items.clear
    self.status = "submitted"
    self.user.current_cart_id = nil
    self.user.save
  end


end
