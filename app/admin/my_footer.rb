class MyFooter < ActiveAdmin::Component
  def build
    div :id => "footer" do
      small "Copyright #{Date.today.year} Cactus Code d.o.o. | #{link_to("MDM", root_path)}".html_safe
    end
  end
end