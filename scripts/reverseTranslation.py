# Importing necessary modules
from Bio import SeqIO  # For parsing FASTA files
import sys            # For accessing command-line arguments

# Function to read a FASTA file and return a dictionary of sequences
def fasDict(i_f):
    """
    Reads a FASTA file and creates a dictionary with sequence IDs as keys and sequences as values.
    
    Parameters:
    i_f (str): Input file name in FASTA format.
    
    Returns:
    dict: Dictionary with sequence IDs as keys and sequences as values.
    """
    seq_dict = {}  # Initializing an empty dictionary
    for record in SeqIO.parse(i_f, "fasta"):  # Parsing each record in the FASTA file
        seq_dict[record.id] = str(record.seq)  # Storing the sequence ID and sequence in the dictionary
    return seq_dict

# Function to print sequences in a formatted way
def printSeq(seq):
    """
    Prints a sequence in a formatted way, with a specified number of characters per line.
    
    Parameters:
    seq (str): The sequence to be printed.
    """
    count = 0
    while count < len(seq):
        print(seq[count: count + 70])  # Printing a part of the sequence per line (70 characters per line)
        count += 70

# Reading amino acid and nucleotide sequences from command-line arguments
aa_seqs = fasDict(sys.argv[1])   # Amino acid sequences
nucl_seqs = fasDict(sys.argv[2]) # Nucleotide sequences

# Aligning nucleotide sequences based on the amino acid sequences
for head, n_seq in nucl_seqs.items():
    if head in aa_seqs:  # Checking if the sequence ID is present in amino acid sequences
        aligned = aa_seqs[head]
        raw_aa = aligned.replace('-', '')  # Removing gaps from the amino acid sequence
        count = 0
        nucl_aligned = ''
        for letter in aligned:
            if letter == '-' or letter == '?':
                nucl_aligned += '---'  # Adding gaps in the nucleotide sequence
            elif count < len(raw_aa) and letter == raw_aa[count]:
                nucl = count * 3
                nucl_aligned += n_seq[nucl:nucl + 3]  # Adding the corresponding nucleotide sequence
                count += 1
        print(f'>{head}')  # Printing the sequence ID
        printSeq(nucl_aligned)  # Printing the aligned nucleotide sequence
