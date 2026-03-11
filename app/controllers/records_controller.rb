# ✅ 修正後
def index
  @records = Record.all
  # これだけでOK！ Railsは自動的に index.html.erb を探しに行きます
end