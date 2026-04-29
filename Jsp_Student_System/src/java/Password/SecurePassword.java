/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Password;

import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.SecretKeySpec;



/**
 *
 * @author angap
 */
public class SecurePassword {
    
    private static final String type="AES";
    private static final byte[] key="MySecretKey12345".getBytes();
    
    public static String encrypt(String data) throws InvalidKeyException, IllegalBlockSizeException, BadPaddingException, NoSuchAlgorithmException, NoSuchPaddingException{
       Cipher cipher=Cipher.getInstance(type);
       SecretKeySpec keyspec=new SecretKeySpec(key,type);
       cipher.init(Cipher.ENCRYPT_MODE, keyspec);
       byte[] encryptdata=cipher.doFinal(data.getBytes());
       return Base64.getEncoder().encodeToString(encryptdata);
    }
    
    public static String decrypt(String encryptdata) throws InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException{
      Cipher cipher=Cipher.getInstance(type);
      SecretKeySpec keyspec=new SecretKeySpec(key,type);
      cipher.init(Cipher.DECRYPT_MODE, keyspec);
      byte[] decodedata=Base64.getDecoder().decode(encryptdata);
      byte[] originaldata=cipher.doFinal(decodedata);
      return new String(originaldata);
    }
}
