// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;

contract BusTicket {
    //CONNECTION TEST AREA

    string conMsg = "Connection Success Babe!";

    function getConMsg() public view returns (string memory) {
        return conMsg;
    }

    function setConMsg(string memory _conMsg) public {
        conMsg = _conMsg;
    }

    //CITY

    // variables
    struct City {
        string name;
        string note;
    }

    mapping(uint256 => City) cityMap;
    uint256 cityMapIndex = 0;

    //functions

    function createCity(City memory _city) public {
        cityMap[cityMapIndex] = _city;
        cityMapIndex += 1;
    }

    function getAllCity() public view returns (City[] memory) {
        City[] memory result = new City[](cityMapIndex);

        for (uint256 index = 0; index < cityMapIndex; index++) {
            result[index] = cityMap[index];
        }
        return result;
    }

    function getByIdCity(uint256 _index) public view returns (City memory) {
        return cityMap[_index];
    }

    function updateCity(uint256 _index, City memory _city) public {
        cityMap[_index] = _city;
    }

    //VEHICLE

    //variables

    struct Vehicle {
        string number;
        string brand;
        uint256 km;
        uint256 capacity;
        bool isActive;
    }

    mapping(uint256 => Vehicle) vehicleMap;
    uint256 vehicleMapIndex = 0;

    //functions

    function createVehicle(Vehicle memory _vehicle) public {
        vehicleMap[vehicleMapIndex] = _vehicle;
        vehicleMapIndex += 1;
    }

    function getAllVehicle() public view returns (Vehicle[] memory) {
        Vehicle[] memory result = new Vehicle[](vehicleMapIndex);

        for (uint256 index = 0; index < vehicleMapIndex; index++) {
            result[index] = vehicleMap[index];
        }
        return result;
    }

    function getAllActiveVehicle() public view returns (Vehicle[] memory) {
        Vehicle[] memory result = new Vehicle[](vehicleMapIndex);

        for (uint256 index = 0; index < vehicleMapIndex; index++) {
            if (vehicleMap[index].isActive) {
                result[index] = vehicleMap[index];
            }
        }
        return result;
    }

    function getByIdVehicle(uint256 _index)
        public
        view
        returns (Vehicle memory)
    {
        return vehicleMap[_index];
    }

    function updateVehicle(uint256 _index, Vehicle memory _vehicle) public {
        vehicleMap[_index] = _vehicle;
    }

    // TRANSFER

    //variables

    // future-1
    // enum TransferStatus {
    //     Start,
    //     Stop,
    //     Waiting
    // }

    struct TransferContent {
        City fromCity;
        City toCity;
        Vehicle vehicle;
        uint256 price;
    }

    struct Transfer {
        uint256 fromCityId;
        uint256 toCityId;
        uint256 vehicleId;
        uint256 price;
        //TransferStatus transferStatus;
        //enum -> status
    }

    mapping(uint256 => Transfer) transferMap;
    uint256 transferMapIndex = 0;

    //functions

    function createTransfer(Transfer memory _transfer) public {
        transferMap[transferMapIndex] = _transfer;
        transferMapIndex += 1;
    }

    function getAllTransferContent()
        public
        view
        returns (TransferContent[] memory)
    {
        TransferContent[] memory result = new TransferContent[](
            transferMapIndex
        );

        for (uint256 index = 0; index < transferMapIndex; index++) {
            Transfer memory transferDetail = transferMap[transferMapIndex];
            City memory fromCity = getByIdCity(transferDetail.fromCityId);
            City memory toCity = getByIdCity(transferDetail.toCityId);
            Vehicle memory vehicle = getByIdVehicle(transferDetail.vehicleId);

            TransferContent memory resultTransferContent = TransferContent(
                fromCity,
                toCity,
                vehicle,
                transferDetail.price
            );

            result[index] = resultTransferContent;
        }

        return result;
    }

    function getAllByIdTransferContent(uint256 _index)
        public
        view
        returns (TransferContent memory)
    {
        Transfer memory transferDetail = transferMap[_index];
        City memory fromCity = getByIdCity(transferDetail.fromCityId);
        City memory toCity = getByIdCity(transferDetail.toCityId);
        Vehicle memory vehicle = getByIdVehicle(transferDetail.vehicleId);

        TransferContent memory result = TransferContent(
            fromCity,
            toCity,
            vehicle,
            transferDetail.price
        );

        return result;
    }
}
