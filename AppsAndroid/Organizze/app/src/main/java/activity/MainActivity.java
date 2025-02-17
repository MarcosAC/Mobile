package activity;

import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import androidx.activity.EdgeToEdge;
import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.content.ContextCompat;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthInvalidCredentialsException;
import com.google.firebase.auth.FirebaseAuthInvalidUserException;
import com.ma.organizze.R;

import fireBaseService.ConfiguracaoFirebase;
import model.Usuario;

public class MainActivity extends AppCompatActivity {
    private EditText etEmail, etSenha;
    private Button btEntrar;
    private TextView tvCriarConta;
    private Usuario usuario;
    private FirebaseAuth autenticacao;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        EdgeToEdge.enable(this);

        // Personaliza a status bar
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            Window window = getWindow();
            window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
            window.setStatusBarColor(ContextCompat.getColor(this, R.color.colorPrimaryDark));
        }

        setContentView(R.layout.activity_login);

        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.activity_login), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });

        etEmail = findViewById(R.id.etEmail);
        etSenha = findViewById(R.id.etSenha);
        btEntrar = findViewById(R.id.btEntrar);
        tvCriarConta = findViewById(R.id.tvCriarConta);

        btEntrar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String email = etEmail.getText().toString();
                String senha = etSenha.getText().toString();

                if (!email.isEmpty()) {
                    if (!senha.isEmpty()) {
                        usuario = new Usuario();
                        usuario.setEmail(email);
                        usuario.setSenha(senha);

                        validarLogin();
                    } else {
                        Toast.makeText(MainActivity.this, "Preencha a senha!", Toast.LENGTH_SHORT).show();
                    }
                } else {
                    Toast.makeText(MainActivity.this, "Preencha o email!", Toast.LENGTH_SHORT).show();
                }
            }
        });

        tvCriarConta.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(MainActivity.this, CadastroActivity.class));
            }
        });
    }

    public void validarLogin() {
        autenticacao = ConfiguracaoFirebase.getFirebaseAutenticacao();
        autenticacao.signInWithEmailAndPassword(
                usuario.getEmail(),
                usuario.getSenha()
        ).addOnCompleteListener(new OnCompleteListener<AuthResult>() {
            @Override
            public void onComplete(@NonNull Task<AuthResult> task) {
                if (task.isSuccessful()) {
                    abrirTelaPrincipal();
                } else {
                    String excecao = "";

                    try {
                        throw task.getException();
                    } catch (FirebaseAuthInvalidUserException e) {
                        excecao = "Usuário não está cadastrado.";
                    } catch (FirebaseAuthInvalidCredentialsException e) {
                        excecao = "E-mail e senha não correspondem a um usuário cadastrado";
                    } catch (Exception e) {
                        excecao = "Erro ao cadastrar usuário: "  + e.getMessage();
                        e.printStackTrace();
                    }

                    Toast.makeText(MainActivity.this,
                            excecao,
                            Toast.LENGTH_SHORT).show();
                }
            }
        });
    }

    public void abrirTelaPrincipal(){
        startActivity(new Intent(this, CadastroActivity.class));
        finish();
    }
}