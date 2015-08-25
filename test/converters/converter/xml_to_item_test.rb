require 'test_helper'

module Converter
  class XmlToItemTest < ActiveSupport::TestCase
    
    def test_properties
      assert_equal 23, xml_to_item.properties.length
      
      expected = ["title", "Public policy towards R&D in oligopolistic industries"]
      assert_equal expected, xml_to_item.properties.first
    end
    
    def test_fields
      expected = {
        "title"=>"single", 
        "creator"=>"multi", 
        "subject"=>"multi", 
        "description"=>"multi", 
        "date"=>"single", 
        "type"=>"multi", 
        "format"=>"single", 
        "identifier"=>"multi", 
        "language"=>"single", 
        "relation"=>"multi"        
      }
      assert_equal expected, xml_to_item.fields
    end
    
    def test_member_of
      assert_equal 'article', xml_to_item.is_member_of
    end
    
    def xml_to_item
      @xml_to_item ||= XmlToItem.new item_xml_from_file
    end
  end
end