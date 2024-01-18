public class Counter {
    static String counter = "";

    public static void increment() {
        char[] binaryArray = counter.toCharArray();

        // Start from the rightmost bit (least significant bit)
        for (int i = binaryArray.length - 1; i >= 0; i--) {
            if (binaryArray[i] == '0') {
                // Flip '0' to '1' and stop the loop
                binaryArray[i] = '1';
                break;
            } else {
                // Flip '1' to '0'
                binaryArray[i] = '0';
            }
        }

        // Convert the char array back to a string
        counter = new String(binaryArray);
    }

    public static int countBits(int number) {
        int count = 0;
        // Loop until the number becomes 0
        while (number > 0) {
            // Right shift the number by 1 bit
            number = number >> 1;
            // Increment the count of bits
            count++;
        }
        // Return the total count of bits
        return count;
    }
}
