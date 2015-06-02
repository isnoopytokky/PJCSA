	/********************************/
		/******* change provinces******/
		/** *************************** */
		$(document).on('change', '#provinces,#Sprovinces', function(e) {
			if (e.target.id == "provinces") var location = ["provinces","amphures","districts"];
			else var location = ["Sprovinces","Samphures","Sdistricts"];
			var id = $('[id='+location[0]+']').index(e.target);
			var val = $('[id='+location[0]+']').eq(id).val();
			$('[id='+location[1]+']').eq(id).html("");
			$('[id='+location[2]+']').eq(id).html("");
			$('[id='+location[1]+']').eq(id).load('address/amphures', {
				id : val
			});

			if (e.target.id == "Sprovinces") {
				search();
			}
		});

		/** ***************************** */
		/** ***** change amphures***** */
		/** *************************** */
		$(document).on('change', '#amphures,#Samphures', function(e) {
			if (e.target.id == "amphures") var location = ["provinces","amphures","districts"];
			else var location = ["Sprovinces","Samphures","Sdistricts"];
			var id = $('[id='+location[1]+']').index(e.target);
			var val = $('[id='+location[1]+']').eq(id).val();
			$('[id='+location[2]+']').eq(id).html("");
			$('[id='+location[2]+']').eq(id).load('address/districts', {
				id : val
			});
			if (e.target.id == "Samphures") {
				search();
			}
		});
		
		/** ***************************** */
		/** ***** change districts***** */
		/** *************************** */
		$(document).on('change', '#Sdistricts', function(e) {
				search();
		});

		/** ***************************** */
		/** *** add , edit member **** */
		/** *************************** */
		$(document).on(
				'click',
				'#edit,#cancel,#add',
				function(e) {
					var obj = e.target.id;
					var id = $('[id=' + obj + ']').index(e.target);
					alert(id);
					var _id = id;
					var user = $('[id=user]').eq(id);
					var pass = $('[id=pass]').eq(id);
					var name = $('[id=name]').eq(id);
					var address = $('[id=address]').eq(id);
					var districts = $('[id=districts]').eq(id);
					var amphures = $('[id=amphures]').eq(id);
					var provinces = $('[id=provinces]').eq(id);
					var cancel = $('[id=cancel]').eq(id);
					if ($(this).val() == "Edit") {
						$('[id=edit]').eq(id).val("Update");
						$('[id=cancel]').eq(id).removeClass("hide");
						memberEnable(user, pass, name, address, districts,
								amphures, provinces);
					} else {
						if ( $(this).val()  == "Update" || $(this).val()  == "Add") {
							$.ajax({
								type : 'POST',
								url : 'member/create',
								data : {
									id :  $('[id=id]').eq(id).val(),
									user : user.val(),
									pass : pass.val(),
									name : name.val(),
									address : address.val(),
									'districts.districtId' : districts.val(),
									action : $(this).val(),
								}
							}).success(function(msg) {
								alert('success ');
							}).fail(function(msg) {
								alert('failed ');
							});
						}

						if ( $(this).val()  == "Add"){
							$('[id=add]').eq(id).addClass("hide");
							$('[id=edit]').eq(id).removeClass("hide");
							$('[id=delete]').eq(id).removeClass("hide");
						}
						
						memberDisable(user, pass, name, address, districts,
								amphures, provinces);
							$('[id=edit]').eq(id).val("Edit");
							$('[id=cancel]').eq(id).addClass("hide");
						
					}
					e.preventDefault();
				});
		
		/** ***************************** */
		/** *** search member **** */
		/** *************************** */
		$(document).on(
				'keyup',
				'#Suser,#Sname,#Saddress',
				function(e) {
					search();
					e.preventDefault();
				});
		
		function search() {
			var user = $('#Suser');
			var pass = $('#Spass');
			var name = $('#Sname');
			var created = $('#Screated');
			var address = $('#Saddress');
			var districts = $('#Sdistricts');
			var amphures = $('#Samphures');
			var provinces = $('#Sprovinces');
			$.ajax({
				type : 'POST',
				url : 'member/search',
				data : {
					user : user.val(),
					name : name.val(),
					pass : pass.val(),
					created : created.val(),
					address : address.val(),
					'districts.districtId' : districts.val(),
					'districts.amphures.amphurId':amphures.val(),
					'districts.amphures.provinces.provinceId':provinces.val(),
				}
			}).success(function(msg) {
				$("#contents").html(msg);
				
			}).fail(function(msg) {
				alert('failed '+msg);
			});
			
		}

		/** ***************************** */
		/** **** delete member ***** */
		/** *************************** */
		$(document).on('click', '#delete', function(e) {
			if (!confirm('ต้องการลบ'))
				return false;
			var id = $('[id=delete]').index(e.target);
			$.ajax({
				type : 'POST',
				url : 'member',
				data : {
					id : $('[id=id]').eq(id).val(),
					action : 'delete'
				}
			}).success(function(msg) {
				if (msg.trim() != "")
					alert(msg);
				else {
					alert('ลบข้อมูลสำเร็จ');
					if ($("table tr.row" + id).length)
						$("table tr.row" + (id+1) ).remove();

				}
			}).fail(function(msg) {
				alert('failed ');
			});
			e.preventDefault();
		});

		/** ***************************** */
		/**
		 * ***** add 10
		 * <tr></tr>
		 * *****
		 */
		/** *************************** */
		$("#p10")
				.click(
						function() {
							for (var i = 0; i < 10; i++) {
								$("table tr#row1")
										.clone()
										.find('span,input,select')
										.each(
												function(e) {
													/*
													 * $(this).val('').attr('id',
													 * function(_, id) { return
													 * id + tr_id });
													 */
													if ($(this).attr('class')=="no" )  $(this).text(tr_id) ;
													if ($(this).attr('name')  ) {
														var item = $(this)
																.attr('type') == "submit" ? $(this)
																: $(this).val(
																		'');
														item.attr( 'name',function(_,id) {
																			var name1 = id.split("[");
																			if (name1.length == 2) {
																				var name2 = name1[1].split("]");
																				var name = name1[0]+ "["+ tr_id+ "]"+ name2[1];
																				return name;
																			} else {
																				return id;
																			}
																		});
													}
												}).end().appendTo("tbody#newcell").removeAttr("id").removeClass("hide").addClass("row" + tr_id);
								tr_id++;
							}
							return false;
						});

		$("button").addClass("btn btn-default");
		$("input[type=submit]").addClass("btn btn-default");