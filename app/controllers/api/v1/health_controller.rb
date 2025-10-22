module Api
  module V1
    class HealthController < ApplicationController
      def index
        render html: <<-HTML.html_safe
          <div style="font-family: 'Segoe UI', sans-serif; text-align:center; margin-top:10%; color:#ff69b4;">
            <h1 style="font-size:3rem;">💖 Hello, Rails API is running! 💖</h1>
            <p style="font-size:1.2rem; color:#444;">
              Environment: <b>Development</b><br>
              Time: #{Time.now.strftime("%Y-%m-%d %H:%M:%S")}
            </p>
            <p style="font-size:0.9rem; color:#888;">Made with 💎 Ruby on Rails 8 & Ceren’s magic ✨</p>
          </div>
        HTML
      end
    end
  end
end
