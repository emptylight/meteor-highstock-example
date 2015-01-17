#
# * Function to draw the chart with local data
#
builtStockRemote = ->
  url = "http://www.highcharts.com/samples/data/jsonp.php?filename=aapl-c.json&callback=?"
  url = "http://api.money.126.net/data/feed/500018,money.api&_ntes_quote_callback=?"
  #_ntes_quote_callback({"500018": {"sname": "\u57fa\u91d1\u5174\u548c", "jz": 0, "symbol": "500018", "update": "2015/01/16 15:59:02", "pchg": 0.0028245518739814617, "navdate": "2014/05/23 00:00:00", "nav": 0.9231, "zf": 0} });
  $.getJSON url, (rdata) ->
    data = rdata["500018"]
    $("#container-remote").highcharts "StockChart",
      rangeSelector:
        selected: 1

      title:
        text: "AAPL Stock Price"
      
      series: [{
        name: "AAPL"
        data: data
        tooltip:
          valueDecimals: 3
        },
        {
        name: "AAPL"
        data: data
        tooltip:
          valueDecimals: 3

        }

      ]

    return

  return

#
# * Call the function to built the chart when the template is rendered
#
Template.remoteData.rendered = ->
  builtStockRemote()
  return
