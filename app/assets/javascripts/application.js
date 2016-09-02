// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks

window.App = window.App || {} 


App.updateBoard = function (player) {
	// Show turn info 
	$('#player-turn').html("<small>Your Turn</small>");				
	// Enable form
	$("#guess_form :input").attr("disabled", false);						
};

// Checks if is user current turn using short polling.
// if is user current turns it calls to App.updateboard.
App.checkTurn = function (player) {
	var isMyTurn;
	var interval = setInterval(function () {
		$.ajax({ 
			url: "/games/"+player+"/turn",
			dataType: "json"
		}).done(function (data) {
			if (data.turn) {
				// It's my turn! clear the setInterval
				clearInterval(interval);
				// Update board: turn info, and grids.
				console.log('Turn to sink enemy ships!');
				
				App.updateBoard(player);
			} else {
				console.log('not my turn :(');
			}
		});
	}, 5000);
};

App.init = function () {
	// Execute the following stment only if current view is "game#show": 
	var $sel = $('.games.show');
	if ($sel.length > 0) {
		// Check for turn changes.
		App.checkTurn($sel.data('game_id'));
	}
};

$(document).on("turbolinks:load", function () {
  App.init()
});
