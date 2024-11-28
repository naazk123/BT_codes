// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentData {
    struct Student {
        string name;
        uint age;
        string grade;
    }
    Student[] public students;
    function addStudent(string memory _name, uint _age, string memory _grade) public {
        Student memory newStudent = Student({
            name: _name,
            age: _age,
            grade: _grade
        });

        students.push(newStudent); // Add student to the students array
    }
    function getStudent(uint _index) public view returns (string memory, uint, string memory) {
        require(_index < students.length, "Student does not exist.");
        Student memory student = students[_index];
        return (student.name, student.age, student.grade);
    }
    fallback() external payable {
        // The fallback function does nothing here but it will allow receiving ether
    }
    receive() external payable {
        // This function is executed when ether is sent to the contract
    }
}
