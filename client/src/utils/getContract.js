import { ethers } from "ethers";
import { BUSTICKET_CONTRACT_ADDRESS } from "./constants";
import BusTicket from "../contracts/BusTicket.json";

async function requestAccount() {
  await window.ethereum.request({ method: "eth_requestAccounts" });
}

export const busTicket = async () => {
  if (typeof window.ethereum == "undefined") {
    console.log("ether undefined!");
  }
  await requestAccount();
  const provider = new ethers.providers.Web3Provider(window.ethereum);
  const signer = provider.getSigner();
  const contract = new ethers.Contract(
    BUSTICKET_CONTRACT_ADDRESS,
    BusTicket.abi,
    signer
  );
  return contract;
};
