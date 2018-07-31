class Registration < ApplicationRecord
  belongs_to :order

  def paypal_url(return_path)
    values = {
      business: "jerry.goldenowl-facilitator@gmail.com",
      cmd: "_xclick",
      upload: 1,
      return: "http://localhost:3000#{return_path}",
      invoice: id,
      amount: order.subtotal,
      quantity: '1',
      notify_url: "http://localhost:3000/hook"
    }
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end
end
