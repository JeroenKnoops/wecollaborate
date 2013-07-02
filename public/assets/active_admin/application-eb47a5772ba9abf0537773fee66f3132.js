(function(){window.AA={}}).call(this),function(){window.AA.CheckboxToggler=AA.CheckboxToggler=function(){function t(t,e){var n;this.options=t,this.container=e,n={},this.options=$.extend({},n,t),this._init(),this._bind()}return t.prototype._init=function(){if(!this.container)throw new Error("Container element not found");if(this.$container=$(this.container),!this.$container.find(".toggle_all").length)throw new Error('"toggle all" checkbox not found');return this.toggle_all_checkbox=this.$container.find(".toggle_all"),this.checkboxes=this.$container.find(":checkbox").not(this.toggle_all_checkbox)},t.prototype._bind=function(){var t=this;return this.checkboxes.change(function(e){return t._didChangeCheckbox(e.target)}),this.toggle_all_checkbox.change(function(){return t._didChangeToggleAllCheckbox()})},t.prototype._didChangeCheckbox=function(){switch(this.checkboxes.filter(":checked").length){case this.checkboxes.length-1:return this.toggle_all_checkbox.prop({checked:null});case this.checkboxes.length:return this.toggle_all_checkbox.prop({checked:!0})}},t.prototype._didChangeToggleAllCheckbox=function(){var t,e=this;return t=this.toggle_all_checkbox.prop("checked")?!0:null,this.checkboxes.each(function(n,o){return $(o).prop({checked:t}),e._didChangeCheckbox(o)})},t}(),jQuery(function(t){return t.widget.bridge("checkboxToggler",AA.CheckboxToggler)})}.call(this),function(){window.AA.DropdownMenu=AA.DropdownMenu=function(){function t(t,e){var n;this.options=t,this.element=e,this.$element=$(this.element),n={fadeInDuration:20,fadeOutDuration:100,onClickActionItemCallback:null},this.options=$.extend({},n,t),this.$menuButton=this.$element.find(".dropdown_menu_button"),this.$menuList=this.$element.find(".dropdown_menu_list_wrapper"),this.isOpen=!1,this._buildMenuList(),this._bind()}return t.prototype.open=function(){return this.isOpen=!0,this.$menuList.fadeIn(this.options.fadeInDuration),this._positionMenuList(),this._positionNipple(),this},t.prototype.close=function(){return this.isOpen=!1,this.$menuList.fadeOut(this.options.fadeOutDuration),this},t.prototype.destroy=function(){return this.$element.unbind(),this.$element=null,this},t.prototype.isDisabled=function(){return this.$menuButton.hasClass("disabled")},t.prototype.disable=function(){return this.$menuButton.addClass("disabled")},t.prototype.enable=function(){return this.$menuButton.removeClass("disabled")},t.prototype.option=function(t,e){return $.isPlainObject(t)?this.options=$.extend(!0,this.options,t):null!=t?this.options[t]:this.options[t]=e},t.prototype._buildMenuList=function(){return this.$menuList.prepend('<div class="dropdown_menu_nipple"></div>'),this.$menuList.hide()},t.prototype._bind=function(){var t=this;return $("body").bind("click",function(){return t.isOpen===!0?t.close():void 0}),this.$menuButton.bind("click",function(){return t.isDisabled()||(t.isOpen===!0?t.close():t.open()),!1})},t.prototype._positionMenuList=function(){var t,e,n;return t=this.$menuButton.position().left+this.$menuButton.outerWidth()/2,e=this.$menuList.outerWidth()/2,n=t-e,this.$menuList.css("left",n)},t.prototype._positionNipple=function(){var t,e,n,o,i;return n=this.$menuList.outerWidth()/2,e=this.$menuButton.position().top+this.$menuButton.outerHeight()+10,this.$menuList.css("top",e),t=this.$menuList.find(".dropdown_menu_nipple"),o=t.outerWidth()/2,i=n-o,t.css("left",i)},t}(),function(t){return t.widget.bridge("aaDropdownMenu",AA.DropdownMenu),t(function(){return t(".dropdown_menu").aaDropdownMenu()})}(jQuery)}.call(this),function(){window.AA.Popover=AA.Popover=function(){function t(t,e){var n;this.options=t,this.element=e,this.$element=$(this.element),n={fadeInDuration:20,fadeOutDuration:100,autoOpen:!0,pageWrapperElement:"#wrapper",onClickActionItemCallback:null},this.options=$.extend({},n,t),this.$popover=null,this.isOpen=!1,this.$popover=$(this.$element.attr("href")).length>0?$(this.$element.attr("href")):this.$element.next(".popover"),this._buildPopover(),this._bind()}return t.prototype.open=function(){return this.isOpen=!0,this.$popover.fadeIn(this.options.fadeInDuration),this._positionPopover(),this._positionNipple(),this},t.prototype.close=function(){return this.isOpen=!1,this.$popover.fadeOut(this.options.fadeOutDuration),this},t.prototype.destroy=function(){return this.$element.removeData("popover"),this.$element.unbind(),this.$element=null,this},t.prototype.option=function(){},t.prototype._buildPopover=function(){return this.$popover.prepend('<div class="popover_nipple"></div>'),this.$popover.hide(),this.$popover.addClass("popover")},t.prototype._bind=function(){var t=this;return $(this.options.pageWrapperElement).bind("click",function(){return t.isOpen===!0?t.close():void 0}),this.options.autoOpen===!0?this.$element.bind("click",function(){return t.isOpen===!0?t.close():t.open(),!1}):void 0},t.prototype._positionPopover=function(){var t,e,n;return t=this.$element.offset().left+this.$element.outerWidth()/2,e=this.$popover.outerWidth()/2,n=t-e,this.$popover.css("left",n)},t.prototype._positionNipple=function(){var t,e,n,o,i;return n=this.$popover.outerWidth()/2,e=this.$element.offset().top+this.$element.outerHeight()+10,this.$popover.css("top",e),t=this.$popover.find(".popover_nipple"),o=t.outerWidth()/2,i=n-o,t.css("left",i)},t}(),function(t){return t.widget.bridge("popover",AA.Popover)}(jQuery)}.call(this),function(){var t,e={}.hasOwnProperty,n=function(t,n){function o(){this.constructor=t}for(var i in n)e.call(n,i)&&(t[i]=n[i]);return o.prototype=n.prototype,t.prototype=new o,t.__super__=n.prototype,t};window.AA.TableCheckboxToggler=AA.TableCheckboxToggler=function(e){function o(){return t=o.__super__.constructor.apply(this,arguments)}return n(o,e),o.prototype._init=function(){return o.__super__._init.apply(this,arguments)},o.prototype._bind=function(){var t=this;return o.__super__._bind.apply(this,arguments),this.$container.find("tbody td").click(function(e){return"checkbox"!==e.target.type?t._didClickCell(e.target):void 0})},o.prototype._didChangeCheckbox=function(t){var e;return o.__super__._didChangeCheckbox.apply(this,arguments),e=$(t).parents("tr"),t.checked?e.addClass("selected"):e.removeClass("selected")},o.prototype._didClickCell=function(t){return $(t).parent("tr").find(":checkbox").click()},o}(AA.CheckboxToggler),jQuery(function(t){return t.widget.bridge("tableCheckboxToggler",AA.TableCheckboxToggler)})}.call(this),function(){$(function(){return $(document).on("focus",".datepicker:not(.hasDatepicker)",function(){return $(this).datepicker({dateFormat:"yy-mm-dd"})}),$(".clear_filters_btn").click(function(){return window.location.search=""}),$(".dropdown_button").popover(),$("#q_search").submit(function(){return $(this).find(":input").filter(function(){return""===this.value}).prop("disabled",!0)})})}.call(this),function(){jQuery(function(t){return t(document).delegate("#batch_actions_selector li a","click.rails",function(){return t("#batch_action").val(t(this).attr("data-action")),t("#collection_selection").submit()}),t("#batch_actions_selector").length&&t(":checkbox.toggle_all").length?(t(".paginated_collection table.index_table").length?t(".paginated_collection table.index_table").tableCheckboxToggler():t(".paginated_collection").checkboxToggler(),t(".paginated_collection").find(":checkbox").bind("change",function(){return t(".paginated_collection").find(":checkbox").filter(":checked").length>0?t("#batch_actions_selector").aaDropdownMenu("enable"):t("#batch_actions_selector").aaDropdownMenu("disable")})):void 0})}.call(this);