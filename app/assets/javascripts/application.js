//= require jquery
//= require jquery_ujs
//= require flat-ui
//= require bootstrap
//= require lib/bootstrap-editable
//= require_tree .

$.fn.editable.defaults.mode = 'inline';

function GetCreditCardTypeByNumber(ccnumber) {
    var cc = (ccnumber + '').replace(/\s/g, ''); //remove space

    if ((/^(34|37)/).test(cc) && cc.length == 15) {
        return 'AMEX'; //AMEX begins with 34 or 37, and length is 15.
    } else if ((/^(51|52|53|54|55)/).test(cc) && cc.length == 16) {
        return 'MasterCard'; //MasterCard beigins with 51-55, and length is 16.
    } else if ((/^(4)/).test(cc) && (cc.length == 13 || cc.length == 16)) {
        return 'Visa'; //VISA begins with 4, and length is 13 or 16.
    } else if ((/^(300|301|302|303|304|305|36|38)/).test(cc) && cc.length == 14) {
        return 'DinersClub'; //Diners Club begins with 300-305 or 36 or 38, and length is 14.
    } else if ((/^(2014|2149)/).test(cc) && cc.length == 15) {
        return 'enRoute'; //enRoute begins with 2014 or 2149, and length is 15.
    } else if ((/^(6011)/).test(cc) && cc.length == 16) {
        return 'Discover'; //Discover begins with 6011, and length is 16.
    } else if ((/^(3)/).test(cc) && cc.length == 16) {
        return 'JCB';  //JCB begins with 3, and length is 16.
    } else if ((/^(2131|1800)/).test(cc) && cc.length == 15) {
        return 'JCB';  //JCB begins with 2131 or 1800, and length is 15.
    }
    return '?'; //unknown type
}

$(function () {
   $('.active-search-link a').click(function () {
       var header = $('.active-search-header');
       var headerOpen = $('.active-search-header').hasClass('open');

       if (headerOpen) {
           $('.active-search-header').slideUp().removeClass('open');
       } else {
           $('.active-search-header').slideDown().addClass('open');
       }
   });

   $('.active-search-header .close-btn').click(function() {
       $('.active-search-header').slideUp().removeClass('open');
   });

   $('.search-item').editable();
});