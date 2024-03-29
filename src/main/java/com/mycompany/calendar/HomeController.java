package com.mycompany.calendar;

import java.util.Locale;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.calendar.domain.CalendarUser;
import com.mycompany.calendar.domain.Event;
import com.mycompany.calendar.domain.EventAttendee;
import com.mycompany.calendar.service.CalendarService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private CalendarService calendarService;	
	
	private CalendarUser[] calendarUsers = null;
	private Event[] events = null;
	private EventAttendee[] eventAttentees = null;
	
	private Random random = new Random(System.currentTimeMillis());

	private static final int numInitialNumUsers = 12;
	private static final int numInitialNumEvents = 4;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		calendarUsers = new CalendarUser[numInitialNumUsers];
		events = new Event[numInitialNumEvents];
		eventAttentees = new EventAttendee[numInitialNumEvents];
		
		this.calendarService.deleteAllUsers();
		this.calendarService.deleteAllEvents();
		this.calendarService.deleteAllEventAttendees();
		
		for (int i = 0; i < numInitialNumUsers; i++) {
			calendarUsers[i] = new CalendarUser();
			calendarUsers[i].setEmail("user" + i + "@example.com");
			calendarUsers[i].setPassword("user" + i);
			calendarUsers[i].setName("User" + i);
			calendarUsers[i].setId(calendarService.createUser(calendarUsers[i]));
		}
		
		for (int i = 0; i < numInitialNumEvents; i++) {
			events[i] = new Event();
			events[i].setSummary("Event Summary - " + i);
			events[i].setDescription("Event Description - " + i);
			events[i].setOwner(calendarUsers[random.nextInt(numInitialNumUsers)]);
			switch (i) {				          /* Updated by Assignment 3 */
				case 0:
					events[i].setNumLikes(0);  							
					break;
				case 1:
					events[i].setNumLikes(9);
					break;
				case 2:
					events[i].setNumLikes(10);
					break;
				case 3:
					events[i].setNumLikes(10);
					break;
			}
			events[i].setId(calendarService.createEvent(events[i]));
		}
		
		for (int i = 0; i < numInitialNumEvents; i++) {
			eventAttentees[i] = new EventAttendee();
			eventAttentees[i].setEvent(events[i]);
			eventAttentees[i].setAttendee(calendarUsers[3 * i ]);
			eventAttentees[i].setAttendee(calendarUsers[3 * i + 1]);
			eventAttentees[i].setAttendee(calendarUsers[3 * i + 2]);
			eventAttentees[i].setId(calendarService.createEventAttendee(eventAttentees[i]));
		}
		
		//TODO model에 calendarUsers, events, eventAttentees 배열 객체 추가 
		model.addAttribute("calendarUsers", calendarUsers);
		model.addAttribute("events", events);
		model.addAttribute("eventAttentees", eventAttentees);
		
		return "home";
	}
//    @RequestMapping(value = "/", method = RequestMethod.G)
//    public String processRegistration(@ModelAttribute("userForm") User user, Model model) {
//         
//        this.userService.add(user);         
//        return "register/registrationSuccess";
//    }
//    
//	@RequestMapping(value = "/register", method = RequestMethod.GET)
//    public String viewRegistration(Model model) {
//        User userForm = new User();    
//        model.addAttribute("userForm", userForm);
//         
//        List<String> professionList = new ArrayList<String>();
//        professionList.add("Developer");
//        professionList.add("Designer");
//        professionList.add("IT Manager");
//        model.addAttribute("professionList", professionList); // model에 리스트 넣어줌
//         
//        return "register/registration";
//    }
//     
//    @RequestMapping(value = "/register", method = RequestMethod.POST)
//    public String processRegistration(@ModelAttribute("userForm") User user, Model model) {
//         
//        this.userService.add(user);         
//        return "register/registrationSuccess";
//    }
    
}
