const { expect } = require("chai");

describe("ForLoop", function () {
  let contract;

  beforeEach(async function () {
    const ForLoop = await ethers.getContractFactory("ForLoop");
    contract = await ForLoop.deploy();
    await contract.waitForDeployment();
  });

  it("should add multiple accounts", async function () {
    const users = [
      "0x0000000000000000000000000000000000000001",
      "0x0000000000000000000000000000000000000002"
    ];

    const balances = [100, 200];

    await contract.addMultipleAccounts(users, balances);

    expect(await contract.getAccountsCount()).to.equal(2);
  });
});