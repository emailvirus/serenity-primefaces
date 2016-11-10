package my.lib.serenity.primefaces.showcases.definition;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import my.lib.serenity.primefaces.component.autocomplete.AutoCompleteMode;
import my.lib.serenity.primefaces.showcases.pages.AutocompletePage;
import org.fluentlenium.core.annotation.Page;

/**
 * Created by michael on 12/09/2016.
 */
public class AutocompleteScenarioSteps {
    @Page
    private AutocompletePage page;

    @Given("I open Autocomplete showcase Page")
    public void given_i_open_autocomplete_showcase_page() {
        this.page.open();
        this.page.shouldBeDisplayed();
    }

    @When("I input (.*) into autocomplete of mode (.*)")
    public void when_i_input_text_into_mode(String text, String mode) {
        AutoCompleteMode curMode = AutoCompleteMode.UNDEFINED;
        switch (mode) {
            case "simple":
                curMode = AutoCompleteMode.SIMPLE;
                break;
            case "minlength":
                curMode = AutoCompleteMode.MIN_LENGTH;
                break;
            case "dropdown":
                curMode = AutoCompleteMode.DROP_DOWN;
                break;
            default:
                break;
        }
        this.page.input_text_in_mode(text, curMode);
    }

    @Then("system show me (\\d*) items as result")
    public void then_show_item(int numberOfItem) {
        this.page.should_show_number_of_result(numberOfItem);
    }

    @When("I type a part of theme name (.*), then choose (.*) from result list")
    public void when_i_type_a_part_of_name(String partOfName, String themeName) {
        this.page.type_part_of_name(partOfName, themeName);
    }

    @Then("The theme (.*) must be selected")
    public void then_theme_selected(String themeName) {
        this.page.theme_should_be_selected(themeName);
    }
}

