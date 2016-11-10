package my.lib.serenity.primefaces.showcases.definition;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import my.lib.serenity.primefaces.showcases.pages.TabViewPage;

/**
 * Created by michael on 13/09/2016.
 */
public class TabViewScenarioSteps {
    private TabViewPage page;

    @Given("I open Tabview showcase Page")
    public void given_i_open_tabview() {
        this.page.open();
    }

    @When("I click tab at index (\\d*) in mode (.*)")
    public void when_i_click_tab_by_index_in_mode(int tabIndex, String mode) {
        this.page.click_tab_by_index(tabIndex, mode);
    }

    @Then("The tab (.*) must be active")
    public void then_tab_must_be_active(String tabName) {
        this.page.tab_should_be_active(tabName);
    }

    @When("I click tab name (.*)")
    public void when_i_click_tab(String tabName) {
        this.page.click_tab_by_name(tabName);
    }
}
