class QuotesController < Peacer::Controller
  def index
    quotes = FileModel.all
    render :index, :quotes => quotes
  end

  def show
    quote = FileModel.find(params["id"])
    ua = request.user_agent
    render_response :quote, :obj => quote, :ua => ua
  end

  def a_quote
    render :a_quote, :noun => :winking
  end

  def exception
    raise "It's a bad one!"
  end

  def quote_1
    quote_1 = FileModel.find(1)
    render :quote, :obj => quote_1
  end

  def new_quote
    attrs = {
      "submitter" => "web user",
      "quote" => "A picture is worth one k pixels",
      "attribution" => "Me"
    }
    m = FileModel.create attrs
    render :new_quote, :obj => m
  end
end
