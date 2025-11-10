
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract StudentData{
    //Structure
     
     struct Student{
        string name;
        uint256 rollno;

     }


    //Array
    
    Student[] public StudnetArray;

    function addStudent(string memory name, uint256 rollno) public {
         for (uint i=0; i<StudnetArray.length; i++) 
         {
            if (StudnetArray[i].rollno==rollno){

            revert("Student with this roll no already exists");
            }
         }
         StudnetArray.push(Student(name,rollno));
    }

    function getStudentLength() public view  returns (uint) {
        return  StudnetArray.length;
    }
   

   function displayAllStudents() public view returns (Student[] memory){
     return StudnetArray;
   }


   function getStudentByIndex(uint idx) public view  returns(Student memory) {
    require(idx<StudnetArray.length,"index  out of bound!");
    return StudnetArray[idx];
   }
    //Fallback

    fallback() external payable { 
        //this function will handle external function calls that is not there in out contract
    }
    receive() external payable {
        //this fucntion will handle the ether sent by external user but without data mention 
     }
}