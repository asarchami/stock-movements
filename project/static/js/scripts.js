function load_plot(symbol) {

  var jqxhr = $.getJSON(
      // "{{ url_for('static', filename='datasets/news_quotes/{}.json'.format(symbol)) }}",
      "/static/datasets/news_quotes/"+symbol+".json",
      function() {
        // console.log( "success" );
      })
    .done(function(data) {
      function toUTC(myDate) {
        myDate = myDate.split("-");
        var newDate = myDate[1] + "/" + myDate[2] + "/" + myDate[0];
        return new Date(newDate).getTime()
      }
      // var arr = $.map(data, function(el) {return el;})
      var arr = Object.keys(data).map(function(k) {return data[k]})
      close = Object.keys(arr[2]).map(function(v) {return [toUTC(arr[0][v]), arr[2][v]]});
      compound = Object.keys(arr[7]).map(function(v) {return [toUTC(arr[0][v]), arr[7][v]]});
      // console.log(compound);

      var detailOptions = {
        series: {
          lines: {
            show: true,
            lineWidth: 3
          },
          shadowSize: 0
        },
        grid: {
          hoverable: true,
          // backgroundColor: { colors: ["#96CBFF", "#75BAFF"] }
        },
        yaxis: {
          // color:"#8400FF"
        },
        xaxis: {
          mode: "time",
          // color:"#8400FF"
        },
        selection: {
          mode: "x"
        },
        grid: {
          hoverable: true //IMPORTANT! this is needed for tooltip to work
        },
        tooltip: true,
        tooltipOpts: {
          content: "%s for %x was %y",
          xDateFormat: "%m-%d-%Y",

          onHover: function(flotItem, $tooltipEl) {
            // console.log(flotItem, $tooltipEl);
          }
        }
      };

      var sentOptions = {
        series: {
          points: {
            show: true,
            radius: 3,
            show: true,
            fill: true,
            fillColor: '#058DC7'
          },
          shadowSize: 0
        },
        grid: {
          hoverable: true,
          // backgroundColor: { colors: ["#96CBFF", "#75BAFF"] }
        },
        yaxis: {
          // color:"#8400FF"
        },
        xaxis: {
          mode: "time",
          // color:"#8400FF"
        },
        selection: {
          mode: "x"
        },
        grid: {
          hoverable: true //IMPORTANT! this is needed for tooltip to work
        },
        tooltip: true,
        tooltipOpts: {
          content: "%s for %x was %y",
          xDateFormat: "%m-%d-%Y",

          onHover: function(flotItem, $tooltipEl) {
            // console.log(flotItem, $tooltipEl);
          }
        }
      };

      var masterOptions = {
        series: {
          lines: {
            show: true,
            lineWidth: 3
          },
          shadowSize: 0
        },
        grid: {
          // backgroundColor: { colors: ["#96CBFF", "#75BAFF"] }
        },
        yaxis: {
          // color:"#FAF9CF"
        },
        xaxis: {
          mode: "time",
          // color:"#8400FF"
        },
        selection: {
          mode: "x"
        }
      };

      var dataDetail = [{
        label: "Close Price",
        data: close,
        // color:"#FF7575"
      }];

      var dataSent = [{
        label: "Close Price",
        data: compound,
        // color:"#FF7575"
      }];

      var plotDetail = $.plot($("#example-section32 #detailContainer"),
        dataDetail,
        detailOptions
      );

      var plotSent = $.plot($("#example-section32 #sentimentContainer"),
        dataSent,
        sentOptions
      );

      var plotMaster = $.plot(
        $("#example-section32 #masterContainer"), [{
          data: close,
          color: "#FF7575"
        }],
        masterOptions
      );

      $("#example-section32 #detailContainer").bind(
        "plotselected",
        function(event, ranges) {
          plotDetail = $.plot(
            $("#example-section32 #detailContainer"),
            dataDetail,
            $.extend(true, {}, detailOptions, {
              xaxis: {
                min: ranges.xaxis.from,
                max: ranges.xaxis.to
              }
            })
          );
          plotMaster.setSelection(ranges, true);
        }
      );

      $("#example-section32 #sentimentContainer").bind(
        "plotselected",
        function(event, ranges) {
          plotSent = $.plot(
            $("#example-section32 #sentimentContainer"),
            dataSent,
            $.extend(true, {}, sentOptions, {
              xaxis: {
                min: ranges.xaxis.from,
                max: ranges.xaxis.to
              }
            })
          );
          plotMaster.setSelection(ranges, true);
        }
      );

      $("#example-section32 #masterContainer").bind(
        "plotselected",
        function(event, ranges) {
          plotDetail.setSelection(ranges);
          plotSent.setSelection(ranges);
        }
      );

    })
    .fail(function() {
      console.log("error");
    })






}
