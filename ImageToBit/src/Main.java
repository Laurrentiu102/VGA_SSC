import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class Main {

    public static void main(String[] args) throws IOException {
        FileWriter fileWriter = new FileWriter("image.vhd");
        BufferedImage image = ImageIO.read(new File("img.jpg"));
        int width = image.getWidth(),height = image.getHeight();

        fileWriter.write("library IEEE;\n");
        fileWriter.write("use IEEE.STD_LOGIC_1164.ALL;\n");
        fileWriter.write("use IEEE.STD_LOGIC_ARITH.ALL;\n");
        fileWriter.write("use IEEE.STD_LOGIC_UNSIGNED.ALL;\n");
        fileWriter.write("library work;\n");
        fileWriter.write("use work.resolution.all;\n\n");

        fileWriter.write("entity bram is\n");
        fileWriter.write("    port(\n");
        fileWriter.write("         clk: in std_logic;\n");
        fileWriter.write("         btn_in: in std_logic;\n");
        fileWriter.write("         read_address: in natural;\n");
        fileWriter.write("         read_data: out std_logic_vector(11 downto 0)\n");
        fileWriter.write("         );\n");
        fileWriter.write("end entity;\n");

        fileWriter.write("architecture Behavioral of bram is\n\n");
        fileWriter.write("type image_memory is array (0 to PICTURE_RESOLUTION-1) of std_logic_vector(11 downto 0);\n");
        fileWriter.write("signal image : image_memory := (");
        for(int i=0;i<height;i++)
            for(int j=0;j<width;j++)
            {
                int rgb = image.getRGB(j, i);

                int red = (rgb >> 20) & 0xF; // 4 bits for red
                int green = (rgb >> 12) & 0xF; // 4 bits for green
                int blue = (rgb >> 4) & 0xF; // 4 bits for blue

                String redBinary = String.format("%4s", Integer.toBinaryString(red)).replace(' ', '0');
                String greenBinary = String.format("%4s", Integer.toBinaryString(green)).replace(' ', '0');
                String blueBinary = String.format("%4s", Integer.toBinaryString(blue)).replace(' ', '0');

                String twelveBitColor = redBinary + greenBinary + blueBinary;

                if(i!=0 || j!=0)
                    fileWriter.write("                                ");
                fileWriter.write("\""+twelveBitColor+"\"");
                if(i!=height-1 || j!=width-1)
                    fileWriter.write(",\n");
            }

        fileWriter.write(");\n\n");

        image = ImageIO.read(new File("img1.jpg"));
        width = image.getWidth();
        height = image.getHeight();

        fileWriter.write("signal image1 : image_memory := (");
        for(int i=0;i<height;i++)
            for(int j=0;j<width;j++)
            {
                int rgb = image.getRGB(j, i);

                int red = (rgb >> 20) & 0xF; // 4 bits for red
                int green = (rgb >> 12) & 0xF; // 4 bits for green
                int blue = (rgb >> 4) & 0xF; // 4 bits for blue

                String redBinary = String.format("%4s", Integer.toBinaryString(red)).replace(' ', '0');
                String greenBinary = String.format("%4s", Integer.toBinaryString(green)).replace(' ', '0');
                String blueBinary = String.format("%4s", Integer.toBinaryString(blue)).replace(' ', '0');

                String twelveBitColor = redBinary + greenBinary + blueBinary;

                if(i!=0 || j!=0)
                    fileWriter.write("                                ");
                fileWriter.write("\""+twelveBitColor+"\"");
                if(i!=height-1 || j!=width-1)
                    fileWriter.write(",\n");
            }


        fileWriter.write(");\n\n");

        fileWriter.write("attribute RAM_STYLE : string;\n");
        fileWriter.write("attribute RAM_STYLE of image : signal is \"block\";\n\n");
        fileWriter.write("attribute RAM_STYLE of image1 : signal is \"distributed\";\n\n");

        fileWriter.write("component mpg is\n");
        fileWriter.write("    port(\n");
        fileWriter.write("         clk: in std_logic;\n");
        fileWriter.write("         btn_in: in std_logic;\n");
        fileWriter.write("         btn_out: out std_logic\n");
        fileWriter.write("         );\n");
        fileWriter.write("end component;\n\n");

        fileWriter.write("signal picture_nr: std_logic:='0';\n");
        fileWriter.write("signal btn: std_logic;\n");
        fileWriter.write("signal read_data_aux: std_logic_vector(11 downto 0);\n\n");

        fileWriter.write("begin\n\n");

        fileWriter.write("mono: mpg port map(\n");
        fileWriter.write("      clk=>clk,\n");
        fileWriter.write("      btn_in=>btn_in,\n");
        fileWriter.write("      btn_out=>btn\n");
        fileWriter.write("      );");
        fileWriter.write("\n\n");

        fileWriter.write("process(btn) is\n");
        fileWriter.write("begin\n");
        fileWriter.write("    if rising_edge(btn) then\n");
        fileWriter.write("      picture_nr<=not picture_nr;\n");
        fileWriter.write("    end if;\n");
        fileWriter.write("end process;\n\n");
        fileWriter.write("process(clk,picture_nr) is\n");
        fileWriter.write("begin\n");
        fileWriter.write("    if rising_edge(clk) then\n");
        fileWriter.write("      if picture_nr='0' then\n");
        fileWriter.write("          read_data_aux<=image(read_address);\n");
        fileWriter.write("      end if;\n");
        fileWriter.write("    end if;\n");
        fileWriter.write("end process;\n");
        fileWriter.write("read_data<=image1(read_address) when picture_nr = '1' else\n");
        fileWriter.write("           read_data_aux;\n");
        fileWriter.write("end Behavioral;");

        fileWriter.close();
    }
}

