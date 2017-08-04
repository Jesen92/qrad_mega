class MyFooter < ActiveAdmin::Component
  def build
    div :id => "footer" do
      small "Copyright #{Date.today.year} Cactus Code d.o.o. | #{link_to("QRadar", root_path)}".html_safe
    end
  end
end