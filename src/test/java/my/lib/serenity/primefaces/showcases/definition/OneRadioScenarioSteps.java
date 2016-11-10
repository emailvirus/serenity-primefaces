package my.lib.serenity.primefaces.showcases.definition;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import my.lib.serenity.primefaces.component.oneradio.OneRadioMode;
import my.lib.serenity.primefaces.showcases.pages.OneRadioPage;
import org.fluentlenium.core.annotation.Page;

/**
 * Created by michael on 12/09/2016.
 */
public class OneRadioScenarioSteps {

    @Page
    private OneRadioPage page;

    @Given("I open OneRadio showcase page")
    public void given_i_open_showcase_page() {
        this.page.open();
    }

    @When("I (.*) option, in mode (.*)")
    public void when_i_choose_option_of_mode(String optionText, String mode) {
        OneRadioMode curMode = OneRadioMode.UNDEFINED;
        switch (mode) {
            case "basic":
                curMode = OneRadioMode.BASIC;
                break;
            case "responsive":
                curMode = OneRadioMode.RESPONSIVE;
                break;
            case "custom_layout":
                curMode = OneRadioMode.CUSTOM_LAYOUT;
                break;
            default:
                break;
        }
        this.page.choose_option_by_text_of_mode(optionText, curMode);
    }

    @Then("(.*) should be checked")
    public void then_option_should_be_checked(String optionText) {
        this.page.should_selected_option(optionText);
    }

    @When("I choose option (\\d*), in mode (.*)")
    public void when_i_choose_option_number_of_mode(int optionNumber, String mode) {
        this.page.choose_option_by_index_of_mode(optionNumber - 1, mode);
    }

    @When("I use custom layout mode, I choose option by Text (.*)")
    public void when_i_use_custom_mode_and_choose(String text) {
        this.page.choose_option_by_text_custom_layout(text);
    }
}
