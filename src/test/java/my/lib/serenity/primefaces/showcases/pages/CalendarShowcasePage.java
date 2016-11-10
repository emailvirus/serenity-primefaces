package my.lib.serenity.primefaces.showcases.pages;

import my.lib.serenity.primefaces.component.CalendarComponent;
import my.lib.serenity.primefaces.component.calendar.CalendarMode;
import my.lib.serenity.primefaces.component.factory.PFComponentFactory;
import net.serenitybdd.core.annotations.findby.By;
import net.serenitybdd.core.pages.PageObject;
import net.thucydides.core.annotations.DefaultUrl;
import org.assertj.core.api.Assertions;

import java.time.LocalDate;
import java.util.Locale;

/**
 * Created by michael on 9/8/16.
 */
@DefaultUrl("http://www.primefaces.org/showcase/ui/input/calendar.xhtml")
public class CalendarShowcasePage extends PageObject {
    private String xpathInline = "//span[@id='form:inline' and @class='ui-calendar']";
    private String xpathPopup = "//span[@id='form:popup' and @class='ui-calendar']";
    private String xpathButtonMode = "//span[@id='form:button']";
    private CalendarComponent inlineCalendar;
    private CalendarComponent popupCalendar;
    private CalendarComponent buttonPopupCalendar;
    private CalendarComponent calendar;

    public void select_month_year(int month, int year, CalendarMode mode, String language) {
        if (mode == CalendarMode.INLINE) {
            this.calendar = PFComponentFactory.wrapCalendar(this, By.xpath(this.xpathInline));
        } else if (mode == CalendarMode.POPUP) {
            this.calendar = PFComponentFactory.wrapCalendar(this, By.xpath(this.xpathPopup));
        } else if (mode == CalendarMode.BUTTON) {
            this.calendar = PFComponentFactory.wrapCalendar(this, By.xpath(this.xpathButtonMode));
            this.calendar.click_button_and_wait();
        }
        this.calendar.setLocale(Locale.forLanguageTag(language));
        this.calendar.select_year_month(year, month);
    }

    public void should_selected_date(LocalDate date) {
        Assertions.assertThat(this.calendar.getSelectedDate()).isEqualTo(date);
    }

    public void select_date_of_month(int dateOfMonth, CalendarMode mode) {
        this.calendar.select_date_of_month(dateOfMonth);
    }

}
