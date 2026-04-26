const { expect } = require("chai");

describe("BankProject1", function () {
  let bank, owner;

  beforeEach(async function () {
    [owner] = await ethers.getSigners();
    const Bank = await ethers.getContractFactory("BankProject1");
    bank = await Bank.deploy();
    await bank.waitForDeployment();
  });

  it("should deposit ETH", async function () {
    await bank.deposit({ value: ethers.parseEther("1") });

    const balance = await bank.getBalance();
    expect(balance).to.equal(ethers.parseEther("1"));
  });

  it("should withdraw ETH", async function () {
    await bank.deposit({ value: ethers.parseEther("1") });
    await bank.withdraw(ethers.parseEther("0.5"));

    const balance = await bank.getBalance();
    expect(balance).to.equal(ethers.parseEther("0.5"));
  });

  it("should fail if withdrawing too much", async function () {
    await bank.deposit({ value: ethers.parseEther("1") });

    await expect(
      bank.withdraw(ethers.parseEther("2"))
    ).to.be.revertedWith("Insufficient balance");
  });
});