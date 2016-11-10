package my.lib.serenity.primefaces.showcases.pages;

import my.lib.serenity.primefaces.component.TabViewComponent;
import my.lib.serenity.primefaces.component.factory.PFComponentFactory;
import my.lib.serenity.primefaces.sars.page.AbstractPage;
import net.serenitybdd.core.annotations.findby.By;
import net.thucydides.core.annotations.DefaultUrl;

/**
 * Created by michael on 13/09/2016.
 */
@DefaultUrl("http://www.primefaces.org/showcase/ui/panel/tabView.xhtml")
public class TabViewPage extends AbstractPage {

    private TabViewComponent tabView;

    public void click_tab_by_index(int tabIndex, String mode) {
        this.waitForRenderedElements(By.xpath("//div[contains(@class, 'ui-tabs')]"));
        switch (mode) {
            case "basic":
                this.tabView = PFComponentFactory.wrapTabView(this, "(//div[contains(@class, 'ui-tabs')])[1]");
                break;
            case "lazy":
                this.tabView = PFComponentFactory.wrapTabView(this, this.findAll("//div[contains(concat(@class,' '), 'ui-tabs ')]").get(1));
            default:
                break;

        }

        this.tabView.click_tab_by_index(tabIndex);
    }

    public void tab_should_be_active(String tabName) {
        this.tabView.getTabByName(tabName).should_be_active();
    }

    public void click_tab_by_name(String tabName) {
        this.tabView.getTabByName(tabName).open();
    }
}
