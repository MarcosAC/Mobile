package activity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;

import com.ma.organizze.R;

public class CadastroActivity extends AppCompatActivity {
    private EditText etNome, etEmail, etSenha;
    private Button btCadastrar;
    private ImageButton btVoltar;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_cadastro);

        etNome = findViewById(R.id.etNome);
        etEmail = findViewById(R.id.etEmailCadastro);
        etSenha = findViewById(R.id.etSenhaCadastro);

        btVoltar = findViewById(R.id.btVoltar);
        btCadastrar = findViewById(R.id.btCadastrar);

        btVoltar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(CadastroActivity.this, MainActivity.class));
            }
        });
    }
}