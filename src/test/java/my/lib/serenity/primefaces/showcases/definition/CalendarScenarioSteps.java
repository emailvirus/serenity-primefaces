package my.lib.serenity.primefaces.showcases.definition;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import my.lib.serenity.primefaces.component.calendar.CalendarMode;
import my.lib.serenity.primefaces.showcases.pages.CalendarShowcasePage;
import org.fluentlenium.core.annotation.Page;

import java.time.LocalDate;

/**
 * Created by michael on 9/8/16.
 */
public class CalendarScenarioSteps {
    @Page
    private CalendarShowcasePage calendarPage;

    @Given("^I open Calendar showcase Page$")
    public void i_open_Calendar_showcase_Page() throws Throwable {
        this.calendarPage.open();
        this.calendarPage.shouldBeDisplayed();
    }

    private CalendarMode mode;
    private String locale;

    @When("I open calendar in mode (.*), and locale (.*), select June of 2016, and click 2 day")
    public void when_i_open_in_mode_and_select_date(String mode, String locale) {
        LocalDate date = LocalDate.of(2016, 6, 2);
        switch (mode) {
            case "inline":
                this.mode = CalendarMode.INLINE;
                break;
            case "popup":
                this.mode = CalendarMode.POPUP;
                break;
            case "button":
                this.mode = CalendarMode.BUTTON;
                break;
            default:
                this.mode = CalendarMode.NONE;
                break;

        }
        this.locale = locale;
        this.when_i_select_date(this.mode, date, locale);
    }

    private void when_i_select_date(CalendarMode mode, LocalDate date, String locale) {
        this.calendarPage.select_month_year(date.getMonthValue(), date.getYear(), mode, locale);
        this.calendarPage.select_date_of_month(date.getDayOfMonth(), mode);
    }

    @Then("^The 02/06/2016 element must be selected$")
    public void the_element_must_be_selected() throws Throwable {
        this.calendarPage.should_selected_date(LocalDate.of(2016, 6, 2));
    }

}