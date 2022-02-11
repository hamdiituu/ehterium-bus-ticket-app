import React from "react";
import { busTicket } from "../utils/getContract";
const MainPage = () => {
  async function fetchConMsg() {
    try {
      const data = await busTicket().getConMsg();
      console.log("data: ", data);
    } catch (err) {
      console.log("Error: ", err);
    }
  }

  async function createNewCity() {
    try {
      await busTicket().createCity(["Kocaeli - Otogar", "Bilgi Yok"]);
    } catch (error) {
      console.log("Error : ", error);
    }
  }

  return (
    <div>
      <h1>Main Page</h1>
      <button onClick={() => fetchConMsg()}>Test</button>
      <button onClick={() => createNewCity()}>Create New City</button>
    </div>
  );
};

export default MainPage;
