<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script type='text/javascript'>
    document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar'); // 캘린더가 위치할 엘리먼트

	var calendar = new Calendar(calendarEl, {
		plugins: [ dayGridPlugin ]
	});
	calendar.render();
});
    
    var calendar = new FullCalendar.Calendar(calendarEl, {
    	//themeSystem: themeSystem,		// BootStrap 의 theme 를 적용시킬수 있다.
    	//timeZone: initialTimeZone,	// UTC TimeZone 을 설정(Default : Local)
    	headerToolbar: {	// 상단 버튼 설정(필수)
    		left: 'prevYear,prev,next,nextYear today',
    		center: 'title',
    		right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
    	}
    	, locale: "ko"		// 언어 설정
    	, weekNumbers: true		// 달력 왼쪽에 주차 표시
    	//, weekNumberCalculation: 'ISO'	// 달력상의 주가 월요일부터 시작
    	, businessHours: true		// Work Hour(평일 09:00~17:00, 18시로 변경 위해선 main.min.js 내에 있는 DEF_DEFAULTS 값 수정)
    								// 를 제외한 시간, 날짜 배경색 변경
    	//, initialDate: '2020-07-25',		// 기준일, 미입력시 당일
    	, navLinks: true // 날짜 클릭시 해당일 상세일정으로 View 변경
    	, editable: true	// 일정 수정(이동 및 기간 변경) 여부
    	, dayMaxEvents: true // 한 날짜에 일정이 많을 경우 'more' 표시로 표현 여부
    	, selectable: true	// 날짜셀 클릭 여부(이게 있어야 아래 selct 를 사용할 수 있음)
    	, select: function(arg) {	// 날짜셀 클릭시(아래는 일정 추가) 
    		var title = prompt("Event Title:");
    		if (title) {
    			calendar.addEvent({
    				title: title,
    				start: arg.start,
    				end: arg.end,
    				allDay: arg.allDay
    			})
    		}
    		calendar.unselect();
    	}
    	, unselect: function(arg) {}
    	, droppable: true	// 별도의 일정란에서 캘린더로 일정 추가 가능 여부(아래 drop 과 쌍)
    	, drop: function(arg) {		// 신규 일정 Drop 시, arg 는 drop 하는 일정
    	}
    	, eventReceive: function(arg) {		// Drag&Drop 으로 일정이 추가될 시, arg 는 추가된 일정
    		AppCalendar.saveEvent("in", arg);	// 필자가 추가한 사용자 function
    	}
    	, eventClick: function(arg) {	// 일정을 클릭했을 시, arg 는 클릭한 일정
    		if (confirm("일정을 삭제하시겠습니까?")) {
    			arg.event.remove()
    		}
    	}
    	, eventAdd: function(arg) {		// 날짜 클릭하여 일정 추가시, arg 는 클릭한 일정
    		AppCalendar.saveEvent("in", arg);
    	}
    	, eventChange: function(arg) {	// 일정 변경시(중요!!! eventAdd, eventRemove 이후에도 기능), arg 는 클릭한 일정
    		AppCalendar.saveEvent("up", arg);
    	}
    	, eventRemove: function(arg) {	// 일정 삭제시, arg 는 클릭한 일정
    		AppCalendar.delEvent(arg);
    	}
    	, eventSources: [ {		// 여러개의 aJax 로 기 등록된 일정을 불러옴, aJax 리턴 구조는 json Array 형태 [{},{},{}]
    		url: "aJax URL 1"
    		, method: "POST"
    		, extraParams: {aJax로 보낼 parameter}
    	}, {
    		url: "aJax URL 2"
    		, method: "POST"
    		, extraParams: {aJax로 보낼 parameter}
    	} ]
//    	, events: {		// 단일 aJax 로 기 등록된 일정을 불러옴(위의 eventSources 나 이거 둘중 하나만 사용하면 됨)
//    		url: "aJax URL"
//    		, failure: function() {
//    			alert("호출 오류");
//    		}
//    	}
    	, eventsSet: function(args) {	// 일정 추가, 삭제, 이동 등의 이벤트 발생시 모든 일정 반환
    		$.each(args, function(index, item) {
    			// 전체 아이템 저장
    			// item.id
    			// item.title
    			// item.startStr
    			// item.endStr
    			// item.allDay
    		});
    	}
    	, windowResize: function(arg) {}	// window 사이즈 변경 시
    });

    var AppCalendar = (function() {
    	var calendar = null;
    	var containerEl = document.getElementById("event_box");	// 별도로 이벤트를 Drag&Drop 하기 위한 영역
    	var calendarEl = document.getElementById("calendar");

    	function initCalendar() {
    		new FullCalendar.Draggable(containerEl, {
    			itemSelector: ".external-event",
    			eventData: function(eventEl) {
    				return {
    					title: eventEl.innerText.trim()
    				}
    			}
    		});

    		calendar = new FullCalendar.Calendar(calendarEl, {
    			headerToolbar: {
    				left: 'prevYear,prev,next,nextYear today',
    				center: 'title',
    				right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
    			}
    			, locale: "ko"
    			, weekNumbers: true
    			, businessHours: true
    			, navLinks: true
    			, editable: true
    			, dayMaxEvents: true
    			, selectable: true
    			, select: function(arg) {
    				var title = prompt("Event Title:");
    				if (title) {
    					calendar.addEvent({
    						title: title,
    						start: arg.start,
    						end: arg.end,
    						allDay: arg.allDay
    					})
    				}
    				calendar.unselect();
    			}
    			, unselect: function(arg) {}
    			, droppable: true
    			, drop: function(arg) {
    				if ($("#drop-remove").is(":checked")) {
    					arg.draggedEl.remove();
    				}
    			}
    			, eventReceive: function(arg) {
    				AppCalendar.saveEvent("in", arg);
    			}
    			, eventClick: function(arg) {
    				if (confirm("일정을 삭제하시겠습니까?")) {
    					arg.event.remove()
    				}
    			}
    			, eventAdd: function(arg) {
    				AppCalendar.saveEvent("in", arg);
    			}
    			, eventChange: function(arg) {
    				AppCalendar.saveEvent("up", arg);
    			}
    			, eventRemove: function(arg) {
    				AppCalendar.delEvent(arg);
    			}
    			, eventSources: [ {
    				url: "ajax URL"
    				, method: "POST"
    				, extraParams: {
    					mode: "schedule"
    					, act: "list"
    				}
    			} ]
    		});

    		calendar.render();
    	}

    	return {
    		addEvent: function(title) {
    			if(title.length > 0) {
    				title = title.length === 0 ? "Untitled Event" : title;
    				var html = $('<div class="external-event label label-default">' + title + '</div>');
    				jQuery("#event_box").append(html);
    			}
    		},

    		saveEvent: function(act, arg) {
    			var allday = arg.event.allDay ? 1 : 0;
    			$.post("ajax URL", { "idx" : arg.event.groupId, "title" : arg.event.title, "start" : arg.event.startStr, "end" : arg.event.endStr, "alldate" : allday, "act" : "proc", "mode" : "schedule" }, function (data) {
    				if (data.Result == "ok") {
    					if (act == "in") {
    						arg.event.setProp( "groupId", data.idx );	// 신규 추가된 일정의 일련번호
    						//arg.event.setExtendedProp( "idx", "123123" );
    					}
    				}else{
    					alert("일정 저장중 오류가 발생하였습니다.");
    				}
    			}, "json");
    		},

    		delEvent: function(arg) {
    			var allday = event.allDay ? 1 : 0;
    			$.post("ajax URL", { "idx" : arg.event.groupId, "title" : arg.event.title, "start" : arg.event.startStr, "end" : arg.event.endStr, "alldate" : allday, "act" : "delete", "mode" : "schedule" }, function (data) {
    				if (data.Result == "ok") {
    				}else{
    					alert("일정 삭제중 오류가 발생하였습니다.");
    				}
    			}, "json");
    		},

    		//main function to initiate the module
    		init: function() {
    			initCalendar();
    		}

    	};

    }());
    
    
    </script>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="row">
	<div class="col-md-12">
		<div class="portlet light portlet-fit bordered calendar">
			<div class="portlet-title">
				<div class="caption">
					<i class=" icon-layers font-green"></i>
					<span class="caption-subject font-green sbold uppercase">Calendar</span>
				</div>
			</div>
			<div class="portlet-body">
				<div class="row">
					<div class="col-md-3 col-sm-12">
						<!-- Drag 가능한 별도 추가하는 일정 -->
						<h3 class="event-form-title margin-bottom-20">Draggable Events</h3>
						<div id="external-events">
							<form class="inline-form">
								<input type="text" id="event_title" name="event_title" value="" class="form-control" placeholder="일정" />
								<br/>
								<a href="javascript:;" id="event_add" class="btn green"> 추가 </a>
							</form>
							<hr/>
							<div id="event_box" class="margin-bottom-10"></div> <!-- Drag 가능한 일정 -->
							<label for="drop-remove"><input type="checkbox" id="drop-remove" checked />이동 후 삭제</label>
							<hr class="visible-xs" /> </div>
						<!-- 일정 추가 끝 -->
					</div>
					<div class="col-md-9 col-sm-12">
						<div id="calendar"> </div> <!-- 캘린더가 나오는 위치 -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="moment.min.js" type="text/javascript"></script>
<script src="./fullcalendar/main.min.js" type="text/javascript"></script>
<script src="./fullcalendar/locales/ko.js" type="text/javascript"></script>
<script src="calendar.js" type="text/javascript"></script> <!-- 별도 추가한 스크립트 -->
<script language="javascript" type="text/javascript">
$(document).ready(function() {
	AppCalendar.init();

	$("#event_add").unbind("click").click(function() {
		var title = $("#event_title").val();
		AppCalendar.addEvent(title);
		$("#event_title").val("");
	});
});
</script>
</body>
</html>