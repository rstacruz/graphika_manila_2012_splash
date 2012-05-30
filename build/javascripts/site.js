/**
 * @name      jQuery Countdown
 * @author    mikong
 * @version   0.1
 * @license   MIT License
 *
 * Acknowledgement:
 *   Started from Martin Angelov's jQuery-Countdown code,
 *   but greatly modified.
 *
 * Example:
 *
 *   $('.expiry').countdown({ until: myDate });
 *
 * Options:
 *
 * All options except `until` are optional.
 *
 *   - until: (Date) The date to countdown to. Required.
 *   - selectors: (Dictionary object) Selectors to query.
 *   - update: (Function) Custom function to update text.
 *
 *   until: (Date)
 *   selectors: {
 *     seconds: '.seconds',
 *     minutes: '.minutes',
 *     hours: '.hours',
 *     days: '.days'
 *   }
 *   update: function()
 */
(function(a){function e(a){var e=Math.floor(a/d);a-=e*d;var f=Math.floor(a/c);a-=f*c;var g=Math.floor(a/b);return a-=g*b,{days:e,hours:f,minutes:g,seconds:a}}function f(a){var b=a+"";while(b.length<2)b="0"+b;return b}var b=60,c=60*b,d=24*c;a.fn.countdown=function(b){function j(a,b){function d(d){(!a||a[d]!=b[d])&&c.update(d,f(b[d]))}d("days"),d("hours"),d("minutes"),d("seconds")}function k(a,b){d.find(g[a]).text(b)}var c=a.extend({},{until:new Date,selectors:{seconds:".seconds",minutes:".minutes",hours:".hours",days:".days"},update:k},b),d=a(this),g=c.selectors,h,i;return d.data("countdown_options",c),function l(){h=Math.floor((c.until-new Date)/1e3),h<0&&(h=0);var a=e(h);j(i,a),setTimeout(l,1e3),i=a}(),this}})(jQuery),function(){$("[data-countdown_until]").each(function(){var a,b;a=$(this),b=a.attr("data-countdown_until");if(b)return a.countdown({until:new Date(b),update:function(b,c){var d,e;return d=a.find("."+b+".box"),e=d.find("strong"),d.queue(function(a){var b;return e.removeClass("enter").addClass("exit"),setTimeout(function(){return e.remove()},500),b=$("<strong>").addClass("enter").appendTo(d).text(c),setTimeout(function(){return b.removeClass("enter")},0),setTimeout(a,600)})}})})}.call(this);