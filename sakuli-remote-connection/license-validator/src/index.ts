import {PluginValidator} from "@sakuli/plugin-validator";
import chalk from "chalk";

const LICENSE_KEY = "SAKULI_LICENSE_KEY";
const CONTAINER_IMAGE = "IMG";

const getLicenseToken = () => process.env[LICENSE_KEY];
const getImageName = () => process.env[CONTAINER_IMAGE] || "UNKNOWN_IMAGE";

const getContainerToken = () => "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJjYXRlZ29yeSI6MTIsImlhdCI6MTU4MjczMDM5NiwiYXVkIjoidGFjb25zb2wvc2FrdWxpLXJlbW90ZS1jb25uZWN0aW9uIiwiaXNzIjoic2FrdWxpLmlvIiwic3ViIjoic2FrdWxpX2NvbnRhaW5lciJ9.IwmitGii7DhWTIGCm2XYh1fKB5xqj1H6L2p5h_EkZB9Ao6xhNEj4jF2tVrsZ02awKsIDMfB1ki5EhlikUZebSQ";

const validator = new PluginValidator(getImageName());
try {
    validator.verifyEnvironment(getContainerToken(), getLicenseToken() || "");
    process.exit(0);
} catch (e) {
    console.warn(
        chalk`{red Failed to validate container runtime ${getImageName()}. ${e}}`
    );
    process.exit(-1);
}
