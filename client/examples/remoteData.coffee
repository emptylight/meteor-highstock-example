#
# * Function to draw the chart with local data
#
builtStockRemote = ->
  $.getJSON "http://www.highcharts.com/samples/data/jsonp.php?filename=aapl-c.json&callback=?", (data) ->
    d2 = data
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
        data: data #_.map d2, (d) -> d[4] = d[4] * 1.1
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
