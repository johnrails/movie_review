// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var MovieData = function(){
	var api_key = "37f9a3aae8d511573e5dd4ea7418ab41"
	var api_url = "https://api.themoviedb.org"
  
  var fetchMovies = function(){
    $.ajax({
    	url: api_url+"/3/discover/movie?api_key="+api_key,
    	type: 'GET',
    	dataType: 'json',
    	// data: {param1: 'value1'},
    })
    .done(function(data) {
    	console.log("success");
    	MovieData.formatResponse(data.results);
    })
    .fail(function() {
    	console.log("error");
    })
    .always(function() {
    	console.log("complete");
    });
  }

  var formatResponse = function(data){

  	$.each(data, function(index, value){
  		$('ul#movie-list')
  		.append("<li>"+ value.title+'<a class="review-link" href=/reviews/new?title='+value.title+">Review</a></li>")
  	})
  }

  
  return{
  	fetchMovies: fetchMovies,
  	formatResponse: formatResponse,

  }
}()
