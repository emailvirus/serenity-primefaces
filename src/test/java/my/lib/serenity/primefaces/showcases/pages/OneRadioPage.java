package my.lib.serenity.primefaces.showcases.pages;

import my.lib.serenity.primefaces.component.OneRadioComponent;
import my.lib.serenity.primefaces.component.factory.PFComponentFactory;
import my.lib.serenity.primefaces.component.oneradio.OneRadioMode;
import my.lib.serenity.primefaces.sars.page.AbstractPage;
import net.thucydides.core.annotations.DefaultUrl;

/**
 * Created by michael on 12/09/2016.
 */
@DefaultUrl("http://www.primefaces.org/showcase/ui/input/oneRadio.xhtml")
public class OneRadioPage extends AbstractPage {
    private OneRadioComponent oneRadio;

    public void choose_option_by_text_of_mode(String optionText, OneRadioMode curMode) {
        if (OneRadioMode.BASIC == curMode) {
            this.oneRadio = PFComponentFactory.wrapOneRadio(this, "//*[contains(@id, 'console') and contains(@class,'ui-selectoneradio')]");
        } else if (OneRadioMode.RESPONSIVE == curMode) {
            this.oneRadio = PFComponentFactory.wrapOneRadio(this, "//*[contains(@id,'city2')]");
        }
        this.oneRadio.select_option_by_text(optionText);
    }

    public void should_selected_option(String optionText) {

        this.oneRadio.getOptionByLabel(optionText).should_be_selected();
    }

    public void choose_option_by_index_of_mode(int optionNumber, String mode) {
        this.oneRadio.select_option_by_index(optionNumber);
    }

    public void choose_option_by_text_custom_layout(String text) {
        this.oneRadio = PFComponentFactory.wrapOneRadio(this, "//*[contains(@id,'customRadio')]");
        int index = this.oneRadio.findOptionIndexByText(text);
        this.oneRadio.select_option_by_index(index);
    }
}
