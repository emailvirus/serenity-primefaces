package my.lib.serenity.primefaces.sars.page;

import com.google.common.base.Function;
import my.lib.serenity.primefaces.component.MenuBarItemComponent;
import my.lib.serenity.primefaces.component.factory.PFComponentFactory;
import net.serenitybdd.core.annotations.findby.FindBy;
import net.serenitybdd.core.pages.PageObject;
import net.serenitybdd.core.pages.WebElementFacade;
import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.interactions.Actions;

import javax.annotation.Nullable;
import java.util.concurrent.TimeUnit;

/**
 * Created by michael on 9/6/16.
 */
public abstract class AbstractPage extends PageObject {
    @FindBy(id = "profileBar")
    WebElementFacade profileBar;

    public void should_loggged_in() {
        this.profileBar.shouldBeVisible();
    }

    public void logout() {
        try {
            if(this.profileBar.containsElements(By.xpath("//form[@id='menuForm']/div/ul/li[contains(@class,'user-management')]"))) {
                MenuBarItemComponent menuBarItemComponent = PFComponentFactory.wrapMenuBarItem(this, find(By.xpath("//form[@id='menuForm']/div/ul//li[contains(@class,'user-management')]")));
                menuBarItemComponent.click_and_wait();
                PFComponentFactory.wrapCommandLink(this, By.xpath("//a[@title='Logout']")).click_and_wait();
            } else {
                Actions builder = new Actions(this.getDriver());
                builder.moveToElement(this.profileBar.findElement(By.xpath("//*[@id='profileBarForm:profileMenu']/ul/li[2]"))).build().perform();
                PFComponentFactory.wrapCommandLink(this, By.xpath("//span[text()='Logout']/ancestor::a")).click_and_wait();
            }
        } catch (NoSuchElementException e) {
            System.out.println(e.getMessage());
            return;
        }
    }

    public void wait_for_message_disappeared() {
        this.waitForCondition().withTimeout(30, TimeUnit.SECONDS).pollingEvery(10, TimeUnit.MILLISECONDS).until(new Function<WebDriver, Object>() {
            @Nullable
            @Override
            public Object apply(@Nullable WebDriver webDriver) {
                WebElementFacade messageDialog = find(net.serenitybdd.core.annotations.findby.By.xpath("//div[@id='growl_container']"));
                return !messageDialog.isCurrentlyVisible();
            }
        });
    }
}
