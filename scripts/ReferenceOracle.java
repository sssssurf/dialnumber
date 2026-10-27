// Calls the original Google Java reference library; no algorithm is mirrored.
// Invoked in Java source-file mode by gen-google-compat.mjs.
import com.google.i18n.phonenumbers.PhoneNumberUtil;
import com.google.i18n.phonenumbers.Phonenumber.PhoneNumber;
import com.google.i18n.phonenumbers.AsYouTypeFormatter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;

class ReferenceOracle {
  public static void main(String[] args) throws Exception {
    PhoneNumberUtil util = PhoneNumberUtil.getInstance();
    ArrayList<String> output = new ArrayList<>();
    for (String line : Files.readAllLines(Path.of(args[0]), StandardCharsets.UTF_8)) {
      String[] f = line.split("\t", -1);
      switch (f[1]) {
        case "phone": {
          PhoneNumber p = util.parse(f[3], f[2].isEmpty() ? "ZZ" : f[2]);
          String region = util.getRegionCodeForNumber(p);
          String type = util.getNumberType(p).name().toLowerCase().replace('_', '-');
          output.add(String.join("\t", f[0], "phone", String.valueOf(util.isValidNumber(p)),
            String.valueOf(util.isPossibleNumber(p)),
            util.format(p, PhoneNumberUtil.PhoneNumberFormat.E164),
            region == null ? "" : region, type.equals("unknown") ? "" : type,
            util.format(p, PhoneNumberUtil.PhoneNumberFormat.INTERNATIONAL),
            util.format(p, PhoneNumberUtil.PhoneNumberFormat.NATIONAL)));
          break;
        }
        case "typing": {
          AsYouTypeFormatter formatter = util.getAsYouTypeFormatter(f[2]);
          ArrayList<String> fields = new ArrayList<>();
          fields.add(f[0]); fields.add("typing");
          for (char c : f[3].toCharArray()) fields.add(formatter.inputDigit(c));
          output.add(String.join("\t", fields));
          break;
        }
        case "match": {
          PhoneNumber a = new PhoneNumber().setCountryCode(Integer.parseInt(f[2]))
            .setNationalNumber(Long.parseLong(f[3]));
          PhoneNumber b = new PhoneNumber().setCountryCode(Integer.parseInt(f[4]))
            .setNationalNumber(Long.parseLong(f[5]));
          if (!f[6].isEmpty()) a.setExtension(f[6]);
          if (!f[7].isEmpty()) b.setExtension(f[7]);
          output.add(f[0] + "\tmatch\t" + util.isNumberMatch(a, b).name());
          break;
        }
        default: throw new IllegalArgumentException("Unknown mode " + f[1]);
      }
    }
    Files.write(Path.of(args[1]), output, StandardCharsets.UTF_8);
  }
}
