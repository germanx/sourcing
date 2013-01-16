module ApplicationHelper
  def title(*parts)
      unless parts.empty?
        content_for :title do
          (parts << "Ticketee").join(" - ") unless parts.empty?
      end
    end
  end

  def admins_only(&block)
    block.call if current_user.try(:admin?)
    nil
  end  

  def publishers_only(&block)
    block.call if current_user.try(:publisher?) || current_user.try(:admin?)
    nil
  end  

  def authorized?(permission, thing, &block)
    block.call if can?(permission.to_sym, thing) ||
        current_user.try(:admin?)
    nil
  end

  # Returns the full title on a per-page basis.       # Documentation comment
  def full_title(page_title)                          # Method definition
    base_title = "eRFP"                               # Variable assignment
    if page_title.empty?                              # Boolean test
      base_title                                      # Implicit return
    else
      "#{base_title} | #{page_title}"                 # String interpolation
    end
  end

end
