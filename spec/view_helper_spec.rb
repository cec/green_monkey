require 'spec_helper'

describe GreenMonkey::ViewHelper do
  include ActionView::Helpers::TagHelper
  include GreenMonkey::ViewHelper

  it "should convert time period to iso8601 period" do
    time_to_iso8601(3 * 60 * 60 + 20 * 60 + 19).should == "PT3H20M19S"
  end

  it "should convert date period to iso8601 period" do
    time_to_iso8601(500 * 24 * 60 * 60 + 3 * 60 * 60 + 20 * 60 + 19).should == "P1Y4M13DT3H20M19S"
  end

  it "should work with simple" do
    time_to_iso8601(31557600).should == "P1Y"
    time_to_iso8601(2629800).should == "P1M"
    time_to_iso8601(86400).should == "P1D"
    time_to_iso8601(3600).should == "PT1H"
    time_to_iso8601(60).should == "PT1M"
    time_to_iso8601(1).should == "PT1S"
    time_to_iso8601(0).should == "PT0H0M0S"
  end

  it "should build time tag" do
    time = DateTime.parse("09-09-2014 9:38AM")
    time_tag(time).should == %{<time datetime="2014-09-09T09:38:00+00:00">September 09, 2014 09:38</time>}
  end

  it "should make time interval tag" do
    time = DateTime.parse("09-09-2014 9:38AM")
    tag = time_tag_interval(time, 1.hour + 20.minutes)
    expected_html = %{<time datetime="2014-09-09T09:38:00+00:00/PT1H20M">September 09, 2014 09:38 in 1 hour 20 minutes</time>}
    tag.should == expected_html
  end

  it "should build itemscope and itentype attributes" do
    mida_scope(:Airline).should == %{ itemscope itemtype="http://schema.org/Airline"}
    mida_scope(Post).should ==     %{ itemscope itemtype="http://schema.org/BlogPosting"}
  end

end
