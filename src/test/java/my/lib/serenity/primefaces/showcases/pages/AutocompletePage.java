package my.lib.serenity.primefaces.showcases.pages;

import my.lib.serenity.primefaces.component.AutoCompleteComponent;
import my.lib.serenity.primefaces.component.autocomplete.AutoCompleteMode;
import my.lib.serenity.primefaces.component.factory.PFComponentFactory;
import my.lib.serenity.primefaces.sars.page.AbstractPage;
import net.thucydides.core.annotations.DefaultUrl;
import org.assertj.core.api.Assertions;

/**
 * Created by michael on 12/09/2016.
 */
@DefaultUrl("http://www.primefaces.org/showcase/ui/input/autoComplete.xhtml")
public class AutocompletePage extends AbstractPage {

    private AutoCompleteComponent comp;

    public void input_text_in_mode(String text, AutoCompleteMode mode) {
        if (AutoCompleteMode.SIMPLE == mode) {
            this.comp = PFComponentFactory.wrapAutoComplete(this, "//span[contains(@id,'acSimple')]");
        } else if (AutoCompleteMode.MIN_LENGTH == mode) {
            this.comp = PFComponentFactory.wrapAutoComplete(this, "//span[contains(@id,'acMinLength')]");
        } else if (AutoCompleteMode.DROP_DOWN == mode) {
            this.comp = PFComponentFactory.wrapAutoComplete(this, "//span[contains(@id, ':dd')]");
        }
        if (AutoCompleteMode.DROP_DOWN == mode) {
            this.comp.click_drop_down();
        } else {
            this.comp.input_text(text);
        }

    }

    public void should_show_number_of_result(int numberOfItem) {
        this.comp.should_show_number_of_result(numberOfItem);
    }

    public void type_part_of_name(String partOfName, String name) {
        this.comp = PFComponentFactory.wrapAutoComplete(this, "//span[contains(@id, 'themeCustom')]");
        this.comp.input_text(partOfName);
        this.comp.should_display_result();
        this.comp.select_result_by_text(name);
    }

    public void theme_should_be_selected(String themeName) {
        Assertions.assertThat(this.comp.getValue()).isEqualToIgnoringCase(themeName);
    }
}
