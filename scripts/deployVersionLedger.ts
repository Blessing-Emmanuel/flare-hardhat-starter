import { ethers } from "hardhat";

async function main() {
    const VersionLedger = await ethers.getContractFactory("VersionLedger");
    const versionLedger = await VersionLedger.deploy();
    await versionLedger.waitForDeployment();
    console.log("VersionLedger deployed to:", await versionLedger.getAddress());
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
