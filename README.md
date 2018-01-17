The following code does these things:-
1. Select the file 'test_taqtrade20141201'
2. Adds the line '1 d' to the beginning of the file
3. (first sed) Replaces all empty spaces with commas
4. (second sed) Replaces all commas from the second instance onwards with dashes
5. (third sed) Adds the line 'A,B' to the beginning of the file
6. (fourth sed) Removes carriage return characters from the end of the line
7. (fifth sed) Deletes empty lines
8. Puts output in the file 'test_data.txt'
