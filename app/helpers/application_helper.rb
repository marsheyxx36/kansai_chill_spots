module ApplicationHelper
  # デバイスのエラーメッセージ出力メソッド
  def devise_error_messages
    return '' if resource.errors.empty?

    html = ''
    # エラーメッセージ用のHTMLを生成
    messages = resource.errors.full_messages.each do |msg|
      html += <<~EOF
        #{'     '}
              <p style="color: red;" class="error_msg">#{msg}</p>
      EOF
    end
    html.html_safe
  end
end
