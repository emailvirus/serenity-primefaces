package my.lib.serenity.primefaces.working.features.login;

import cucumber.api.CucumberOptions;
import net.serenitybdd.cucumber.CucumberWithSerenity;
import org.junit.runner.RunWith;

/**
 * Created by arrow on 29/9/16.
 */
@RunWith(CucumberWithSerenity.class)
@CucumberOptions(features = "src/test/resources/working/login/login_by_role.feature",
        glue = {"my.lib.serenity.primefaces.sars.definition"})
public class LoginByRoleFeature {
}
